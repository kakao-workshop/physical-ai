#!/bin/zsh
# 맥에서 LeRobot(MPS) 학습 속도와 메모리를 측정한다. M5 Max 36GB 실측과 같은 조건.
# 쓰는 법:  zsh lerobot-mac-bench.sh          (약 15분, 디스크 약 6GB)
#           QUICK=1 zsh lerobot-mac-bench.sh  (몇 스텝만, 동작 확인용)
# 결과:     ~/lerobot-mac-bench/results.txt
set -u
W=${BENCH_DIR:-$HOME/lerobot-mac-bench}; mkdir -p $W; cd $W
export HF_HOME=$W/hf
command -v uv >/dev/null || { echo "uv 가 필요합니다: brew install uv"; exit 1; }
[ -x .venv/bin/lerobot-train ] || { uv venv -q -p 3.12 .venv && uv pip install -q --python .venv/bin/python "lerobot[smolvla,dataset,training]==0.6.1" || exit 1; }
if [ "${QUICK:-0}" = 1 ]; then SA=6; SS=4; LF=2; else SA=200; SS=40; LF=10; fi
OUT=$W/results.txt
{ echo "== $(date '+%Y-%m-%d %H:%M')"; system_profiler SPHardwareDataType | grep -E "Model Name|Chip|Memory:"; system_profiler SPDisplaysDataType | grep "Total Number of Cores" | head -1; sw_vers -productVersion; .venv/bin/python -c "import torch; print('torch', torch.__version__)"; sysctl vm.swapusage; } | tee -a $OUT
RN='{"observation.images.up": "observation.images.camera1", "observation.images.side": "observation.images.camera2"}'
run(){ name=$1; mp=$2; shift 2; rm -rf out_$name
  if [ "$mp" = bf16 ]; then export ACCELERATE_MIXED_PRECISION=bf16; else unset ACCELERATE_MIXED_PRECISION; fi
  /usr/bin/time -l .venv/bin/lerobot-train --dataset.repo_id=lerobot/svla_so101_pickplace --policy.device=mps --log_freq=$LF \
    --save_checkpoint=false --policy.push_to_hub=false --wandb.enable=false --num_workers=4 --output_dir=out_$name "$@" > $name.log 2>&1
  u=$(grep -o "updt_s:[0-9.]*" $name.log | tail -3 | sed 's/updt_s://' | awk '{s+=$1;n++} END{if(n) printf "%.3f", s/n; else print "실패"}')
  m=$(grep "peak memory footprint" $name.log | awk '{printf "%.1fGB",$1/1073741824}')
  e=$(grep -E "^[A-Za-z]*Error" $name.log | tail -1 | cut -c1-160)
  echo "$name 스텝당 ${u}초 메모리 $m $e" | tee -a $OUT; }
run act_b8_fp32 fp32 --policy.type=act --batch_size=8 --steps=$SA
run act_b8_bf16 bf16 --policy.type=act --batch_size=8 --steps=$SA
run svla_b8_fp32 fp32 --policy.path=lerobot/smolvla_base --rename_map="$RN" --batch_size=8 --steps=$SS
run svla_b16_fp32 fp32 --policy.path=lerobot/smolvla_base --rename_map="$RN" --batch_size=16 --steps=$((SS*3/4))
echo "끝. 비교 기준(M5 Max 32코어 36GB): ACT b8 fp32 0.330초 7.4GB, bf16 0.242초 6.6GB, SmolVLA(빈 카메라 옵션 없이) b8 0.527초 7.4GB, b16 1.109초 12.0GB" | tee -a $OUT
