---
title: 맥에서 해 보기 (실측)
nav_order: 7
description: 맥북(Apple Silicon)에서 LeRobot 학습과 추론, 로봇 없는 시뮬레이션, PiPER Studio 정책 서버를 직접 돌려 본 기록과 숫자
---

# 맥에서 해 보기 (실측)
{: .no_toc }

NVIDIA GPU 없이 맥북 한 대로 어디까지 되는지 직접 돌려 본 기록입니다. 숫자는 모두 아래 「측정 조건」의 맥 한 대에서 나온 값이라 칩과 메모리가 다르면 달라집니다.

1. TOC
{:toc}

## 요약

- **ACT는 맥에서 충분히 학습된다.** batch 8에서 스텝당 0.33초, 20K 스텝 약 1.8시간(bf16 환경변수를 켜면 약 1.3시간).
- **SmolVLA는 batch 16까지 쓸 만하다.** 카메라가 2대면 `--policy.empty_cameras=1`을 주지 않는다(32% 빨라진다). 공식 권장 분량(batch 64 × 20K)은 맥에서 수십 시간이라 임대 GPU가 맞다.
- **추론은 맥 GPU로 실시간이다.** ACT 13ms, SmolVLA 193ms(행동 50개 묶음 한 번).
- **로봇 없이 시뮬레이션으로 학습부터 평가까지 된다.** 맥에서 1시간 학습한 ACT가 ALOHA 시뮬레이션 과제를 50회 중 56% 성공했다(ACT 논문의 같은 조건 50%).
- **PiPER Studio의 정책 서버는 맥에서 코드 수정 없이 MPS로 돈다.** 다만 PiPER Studio 전체는 Linux 전용이다.
- **팔을 맥에 바로 연결하는 것은 아직 확인 전이다.** 소프트웨어 경로는 열려 있다(아래).

## 측정 조건

- MacBook Pro, Apple M5 Max(GPU 32코어), 통합 메모리 36GB, macOS 26.
- LeRobot 0.6.1과 0.5.0(PiPER Studio가 쓰는 버전), PyTorch 2.11. 장치는 `--policy.device=mps`.
- 학습 데이터 `lerobot/svla_so101_pickplace`(SO-101, 에피소드 50개, 카메라 2대 640×480).
- 스텝당 시간은 짧게 돌린 뒤 마지막 세 번 로그의 평균, 메모리는 `/usr/bin/time -l`의 최대값. 20K 환산은 단순 곱이라 긴 학습의 발열과 체크포인트 저장 시간은 빠져 있다.

## 학습 속도

| 모델 | batch | 스텝당 | 메모리 | 20K 스텝 환산 |
|---|---|---|---|---|
| ACT | 8 | 0.330초 | 7.4GB | 약 1.8시간 |
| ACT, bf16 환경변수 | 8 | 0.242초 | 6.6GB | 약 1.3시간 |
| SmolVLA | 8 | 0.527초 | 7.4GB | 약 2.9시간 |
| SmolVLA | 16 | 1.109초 | 12.0GB | 약 6.2시간 |
| SmolVLA | 32 | 약 4.9초 | 26GB | 메모리 압박으로 샘플당 1.5배 느려짐 |
| SmolVLA | 64 | — | 36GB 초과 | 스왑, 쓸 수 없음 |
| SmolVLA, 비전 인코더까지 학습 | 8 | 81초 | 42.7GB | 스왑, 쓸 수 없음 |

- SmolVLA 값은 카메라 2대에 빈 카메라 옵션 없이 측정한 것이다(다음 절).
- LeRobot 0.5.0과 0.6.1은 맥에서 속도 차이가 없었다.
- 메모리가 결정적이다. 16GB 맥은 SmolVLA가 빠듯하고(batch 8에서 약 7.5GB와 시스템 몫), ACT는 대부분 된다.

## SmolVLA를 카메라 2대로 학습할 때

**`--policy.empty_cameras=1`을 주지 않는다.** LeRobot 문서의 `rename_map` 안내는 카메라가 정책이 기대하는 것보다 적으면 이 옵션을 쓰라고 안내한다. 그런데 `smolvla_base`는 원래 데이터에 없는 카메라 칸을 건너뛴다. 이 옵션을 주면 칸이 하나 더 생겨 -1로 채운 가짜 이미지가 비전 인코더를 통째로 거친 뒤 마스크로 버려진다.

| 설정 | 스텝당(batch 8) | 메모리 | loss(10, 20, 30, 40스텝) |
|---|---|---|---|
| `--policy.empty_cameras=1` | 0.768초 | 9.0GB | 1.043, 0.684, 0.570, 0.496 |
| 옵션 없이 | **0.527초** | **7.4GB** | 1.042, 0.684, 0.570, 0.495 |

- 가짜 이미지는 원래 결과에 들어가지 않으므로 loss가 같다. 버려지던 계산만 빠진다.
- 이 낭비는 장치와 상관없는 코드라 GPU에서도 생긴다(코드상). 얼마나 줄어드는지는 GPU에서 측정하지 않았다.
- SmolVLA의 카메라 칸이 3개인 이유. [논문](https://arxiv.org/abs/2506.01844)에 따르면 사전학습에 쓴 커뮤니티 데이터셋 481개의 카메라 이름이 제각각이라 위, 손목, 옆 순서로 세 칸에 맞췄다. 카메라 3대를 꼭 써야 한다는 뜻은 아니고, 논문의 SO-101 실기 평가도 위와 옆 2대였다.

```bash
lerobot-train --policy.path=lerobot/smolvla_base \
  --dataset.repo_id=lerobot/svla_so101_pickplace --policy.device=mps --batch_size=8 \
  --rename_map='{"observation.images.up": "observation.images.camera1", "observation.images.side": "observation.images.camera2"}' \
  --steps=20000 --output_dir=outputs/smolvla
```

## 맥에서 효과가 있었던 것과 없었던 것

| 방법 | 결과 |
|---|---|
| `ACCELERATE_MIXED_PRECISION=bf16` 환경변수 | ACT 27% 빨라짐, loss 같음. SmolVLA는 빨라지지 않았다. M5는 bf16 행렬곱이 fp32의 약 4배라 효과가 컸던 것으로 보이며, M3와 M4는 이득이 작을 것으로 본다 |
| `--policy.use_amp=true` | 효과 없음. LeRobot이 MPS에서 AMP를 끈다 |
| `--policy.compile_model=true` (torch.compile) | 2.7배 느려짐. 맥에서는 끈다 |
| 어텐션을 PyTorch SDPA로 바꾸는 패치 | 효과 없음. SmolVLA의 병목은 비전 인코더다 |
| 이미지 크기 512 → 384 | SmolVLA 3배 빠름(스텝당 0.26초). 사전학습 때와 비전 토큰 수가 달라져 품질은 확인하지 못했다 |
| batch 키우기 | ACT는 샘플당 이득이 거의 없고 SmolVLA는 32부터 오히려 느려진다 |

## 추론 지연

데이터셋의 실제 프레임을 넣고 행동 묶음 한 번을 계산하는 시간(중앙값). 로봇 통신은 빠진 순수 모델 계산이다.

| 모델 | MPS | CPU | 묶음 길이(30fps 기준) |
|---|---|---|---|
| ACT | 13ms | 93ms | 100스텝(3.3초) |
| SmolVLA | 193ms | 10.6초 | 50스텝(1.7초) |

ACT는 CPU로도, SmolVLA는 맥 GPU로 실시간이 된다. SmolVLA를 CPU로 돌리는 것은 현실적이지 않다.

## 로봇 없이 시뮬레이션으로 학습부터 평가까지

LeRobot의 ALOHA 시뮬레이션(`gym-aloha`, MuJoCo)은 맥에서 돈다. 과제는 오른팔이 빨간 큐브를 집어 왼팔에 건네는 `AlohaTransferCube-v0`, 데이터는 사람 시연 50개 `lerobot/aloha_sim_transfer_cube_human`.

| 모델 | 학습 | 성공률(50회) |
|---|---|---|
| 이 맥에서 학습한 ACT | 20K 스텝, batch 8, 59분, 메모리 7.0GB | **56%** |
| 공개 모델 `lerobot/act_aloha_sim_transfer_cube_human` | 100K 스텝 | 78% |
| [ACT 논문](https://arxiv.org/abs/2304.13705) 표 I, 사람 시연 데이터 | 시드 3개 × 50회 | 50% |

- 단계별로 보면 큐브에 닿음 98%, 들어 올림 90%, 건네기 56%였다(논문 82%, 60%, 50%). 실패의 대부분은 들어 올린 뒤 양손이 만나는 건네기 단계였다.
- 50회 평가라 성공률에 ±7%포인트 정도의 오차가 있다. 학습을 늘리면 공개 모델과의 차이가 줄어드는지는 측정하지 않았다.
- 평가 영상은 앞 10회만 저장된다(`lerobot-eval` 기본값).

맥에서 막힌 곳 두 군데.

- **`Namespace gym_aloha not found`로 평가가 죽는다.** 맥의 작업자 프로세스가 환경 등록을 못 물려받는 것으로 보인다(추정). `--eval.use_async_envs=false`로 풀렸다.
- **공개 ACT 모델이 옛 형식이라 0.6.1에서 안 읽힌다**(`ProcessorMigrationError`). 변환해서 쓴다.

```bash
uv pip install gym-aloha
python -m lerobot.processor.migrate_policy_normalization \
  --pretrained-path lerobot/act_aloha_sim_transfer_cube_human --output-dir act_aloha_migrated

# 학습 (0.6.1에는 --eval_freq가 없어 평가는 따로 돌린다)
lerobot-train --policy.type=act --dataset.repo_id=lerobot/aloha_sim_transfer_cube_human \
  --policy.device=mps --batch_size=8 --steps=20000 --output_dir=outputs/act_aloha

# 평가
lerobot-eval --policy.path=outputs/act_aloha/checkpoints/last/pretrained_model \
  --env.type=aloha --env.task=AlohaTransferCube-v0 \
  --eval.n_episodes=50 --eval.batch_size=10 --eval.use_async_envs=false --policy.device=mps
```

## PiPER Studio 정책 서버를 맥에서

[PiPER Studio](https://github.com/WeGo-Robotics/wego-piper-web)의 정책 서버(`wrapper/start_policy_server.py`)를 LeRobot 0.5.0 환경(`lerobot[async]`)으로 맥에서 띄우고, 로봇 클라이언트와 같은 순서로 관측을 보내 행동을 받아 봤다.

| 정책 | 장치 | 왕복(전송 포함, 중앙값) | 서버 안 추론 |
|---|---|---|---|
| ACT | `mps` | 23ms | 약 10ms |
| SmolVLA | `mps` | 216ms | 205ms |

- 코드 수정 없이 `device="mps"`로 올라갔다. ACT 출력은 CPU로 직접 계산한 값과 최대 0.0005 차이였다.
- PiPER Studio 화면의 장치 선택지는 `cuda`와 `cpu`뿐이라 지금은 화면에서 고를 수 없다.
- **0.5.0 정책 서버에서는 `rename_map`으로 카메라 이름을 맞출 수 없다.** 이름을 바꾸기 전에 로봇 카메라 이름으로 정책 설정을 찾아 `KeyError`가 나고 클라이언트는 빈 응답을 받는다. 로봇 쪽 카메라 이름을 정책 설정의 이름(예: `camera1`, `camera2`)과 같게 둔다.
- PiPER Studio 전체(장치 데몬, 카메라, CAN)는 Linux 전용이라 맥에서 돌지 않는다. 맥은 정책 서버와 학습을 맡는 구성이다.

## 체크포인트 버전 호환

0.6.1에서 학습한 체크포인트는 0.5.0(PiPER Studio)이 그대로는 못 읽는다. `config.json`의 `pretrained_revision` 한 줄을 0.5.0이 몰라서 `draccus.utils.DecodingError: The fields 'pretrained_revision' are not valid`로 거부한다. 그 줄만 지우면 읽히고, 같은 입력에 대한 출력이 ACT와 SmolVLA 모두 완전히 같았다.

## 팔과 카메라를 맥에 바로 연결하려면 (확인 전)

실물 팔로는 아직 확인하지 않았습니다. 코드와 패키지로 확인한 내용입니다.

**CAN 어댑터 두 종류.** 로봇팔은 CAN이라는 통신선으로 명령을 주고받고, 컴퓨터에는 USB-CAN 어댑터로 연결한다.

| 방식 | 어떻게 보이나 | Linux | 맥 |
|---|---|---|---|
| gs_usb (candleLight 펌웨어) | USB 장치(`1d50:606f`). Linux는 커널 드라이버가 `can0` 같은 네트워크 인터페이스로 만든다 | SocketCAN(`ip link`) | 커널 드라이버가 없어 python-can이 libusb로 직접 연다 |
| slcan (직렬 CAN) | USB 직렬 포트. 문자로 된 명령으로 CAN 프레임을 주고받는다 | `/dev/ttyACM0` | `/dev/tty.usbmodem...` |

- PiPER에 함께 오는 어댑터는 gs_usb 방식이다(PiPER Studio와 LeRobot 플러그인의 문서와 장치 규칙 기준).
- AgileX의 `piper_sdk`는 0.6.0(2025-10)에서 직렬 CAN과 맥 지원을, 0.6.2에서 Windows와 macOS용 버스 처리를 넣었다.
- 이 맥에서 python-can의 `gs_usb`와 `slcan`이 장치를 찾는 단계까지 정상으로 도는 것을 확인했다(장치가 없어 「찾지 못함」으로 끝남).
- PiPER용 LeRobot 플러그인([WeGo-Robotics/lerobot_robot_piper](https://github.com/WeGo-Robotics/lerobot_robot_piper))은 SDK로 팔을 직접 다루지만, 지금은 CAN을 SocketCAN으로만 연다.
- ⚠️ `piper_sdk`는 SocketCAN이 아닌 버스를 열다 실패해도 예외를 내지 않는다. 연결 확인은 `GetCanFps()`처럼 실제로 들어오는 프레임 수로 한다.

**카메라와 다른 팔.**
- 일반 USB 카메라는 LeRobot의 OpenCV 카메라로 맥에서 된다. 터미널에 카메라 권한을 줘야 한다.
- RealSense는 공식 파이썬 패키지에 맥용 설치 파일이 없고, LeRobot 문서도 macOS에서 불안정하다고 적었다.
- SO-101은 USB 직렬로 제어하는 LeRobot 공식 지원 팔이고, 설치 문서에 맥 안내가 따로 있다.

## 다시 돌려 보기

학습 속도 측정 스크립트 [lerobot-mac-bench.sh](assets/scripts/lerobot-mac-bench.sh). uv가 있으면 가상환경과 데이터를 알아서 받고, ACT와 SmolVLA의 스텝당 시간과 메모리를 `~/lerobot-mac-bench/results.txt`에 적는다(약 15분, 디스크 약 6GB). 칩 이름과 GPU 코어 수를 결과 맨 위에 적으므로 다른 맥과 비교하기 좋다.

```bash
brew install uv
zsh lerobot-mac-bench.sh          # 전체 측정
QUICK=1 zsh lerobot-mac-bench.sh  # 몇 스텝만 돌려 동작 확인
```
