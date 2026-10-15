---
title: 해커톤 사례
nav_order: 4
description: 로봇팔을 쓰는 Physical AI 해커톤 국내외 사례(2025-03~2026-10). 진행 방식, 결과물, 잘된 것과 막힌 것
---

# 해커톤 사례
{: .no_toc }

로봇팔을 쓰는 Physical AI 해커톤이 어떤 방식으로 열렸고 무엇이 나왔는지 정리했습니다. 2026-10-15에 공개 자료로 조사했고, 사례마다 출처를 붙였습니다.

{: .note }
행사 페이지, 기사, 참가자 후기, 공개 저장소와 데이터셋을 바탕으로 했습니다. 숫자는 원문 그대로이고, 출처끼리 숫자가 다르면 함께 적었습니다. 확인하지 못한 것은 「미확인」으로 표시했습니다.

1. TOC
{:toc}

## 한눈에

- 공식 기록이 남은 로봇팔 해커톤은 **2025-03부터** 보이고, 2025-06 Hugging Face의 **LeRobot Worldwide Hackathon** 이후 크게 늘었습니다.
- 장비는 **SO-100/101**이 압도적이고, 모델은 **ACT**가 기본값입니다. 2025년 하반기부터 **SmolVLA**와, NVIDIA가 후원한 행사에서 **GR00T N1.5**가 늘었습니다.
- 결과물은 요리와 음료, 천 접기, 정리와 분류, 게임, 사람 보조가 많았습니다.
- 이틀짜리 행사에서는 수십~수백 에피소드가 현실적인 범위였고, **짧은 단일 과제를 ACT 50 에피소드 안팎으로 학습하면 하루 안에 확실히 동작**했습니다. VLA 계열은 30시간 안팎으로는 자주 실패했습니다.
- 우승작에 **LLM이나 챗봇이 상위 판단을 맡고 ACT나 SmolVLA가 하위 동작을 맡는 구조**가 반복해서 나옵니다.

## 진행 방식 유형

| 유형 | 모습 | 사례 | 좋은 점 | 걸리는 점 |
|---|---|---|---|---|
| 여러 도시 동시 개최 | 장비 지참, 자유 주제, 1분 영상과 데이터셋 제출, 본부 심사 뒤 커뮤니티 투표 | LeRobot Worldwide | 수천 명 규모. 데이터셋이 한곳에 모인다 | 영상으로만 심사해 실물 성공률이 가려진다 |
| 장비 제공, 자유 주제 | 주최가 같은 장비를 나눠 주고 주말 동안 만들어 현장 데모와 문서로 심사 | Seeed × Hackster, Mistral 파리, Revolute 보스턴 | 진입 장벽이 낮고 결과물이 다양하다 | 조립과 캘리브레이션에 시간이 든다. 비교 기준이 모호하다 |
| 테마만 정함 | 「가사」, 「요리」처럼 주제만 주고 해석은 자유 | Seeed 2025-10, Cook with reBot | 결과물이 한 주제로 모여 비교하기 쉽다 | 어려운 테마는 완성품이 적다 |
| 정해진 미션, 시연 채점 | 현장에서 미션을 공개하고 성공 여부나 랩타임으로 순위 | 한성대 × 로보시지, 창원대 | 목표와 채점이 분명하고 공정하다 | 결과물이 비슷해진다. 장비가 많이 필요하다 |
| 공통 미션 → 자유 미션 | 1일차 강사 지도로 공통 집기 놓기(채점 안 함), 이후 자유 미션만 채점. 제출 템플릿과 GitHub 공개 의무 | AMD Open Robotics | 모든 팀이 첫날 동작하는 기준선을 갖는다. 결과가 저장소로 남는다 | 공통 미션에 하루를 쓴다 |
| 기업 출제형 | 현장 문제를 축소한 미션에 **통과 기준과 확장 방향**을 함께 제시. 자율주제는 문제 정의서로 대신 | PAC 2026, POSCO | 실용적이고 후속 협력으로 이어질 수 있다 | 출제 기업과 소품 준비 비용이 크다 |
| 정량 경진 | 시뮬레이션 자동 채점 리더보드 뒤 실기 결선 | LeHome Challenge | 성공률 숫자가 남는다 | 몇 달짜리라 해커톤보다 대회에 가깝다 |
| 제작형 | 구동기만 주고 로봇 자체를 설계 | 로보틱어스 | 폼팩터가 창의적이다 | 시간과 3D 프린터가 많이 든다. 모방학습까지 가기 어렵다 |

## 사례 목록

| 행사 | 언제, 어디 | 장비 | 대표 결과물 |
|---|---|---|---|
| [Seeed × Hackster Embodied AI](#seeed--hackster-embodied-ai-hackathon) | 2025-03 마운틴뷰 | SO-ARM100, Jetson Orin NX(제공) | 양팔 협업 그릇 옮기기(GR00T N1) |
| [Mistral AI Robotics Hackathon](#mistral-ai-robotics-hackathon) | 2025-04 파리 | SO-100 40대 이상(제공) | 「Guess Who」 게임 로봇 |
| [LeRobot Worldwide Hackathon](#lerobot-worldwide-hackathon) | 2025-06 전 세계 | 지참(SO-100/101 등) | 이동 레일 단 팔의 샌드위치 쌓기 |
| [LeRobot 서울, 대구](#lerobot-worldwide-서울과-대구) | 2025-06 서울, 대구 | 서울 지참, 대구 SO-101 지급 | 색 반응 집어 꽂기(글로벌 8위), 양팔 공중 전달(20위) |
| [POSCO 산업용 AI-로봇 경진대회](#posco-산업용-ai-로봇-경진대회) | 2025-09 서울 | 협동로봇 2대(제공) | 불량 블록 교체(전통 제어) |
| [Seeed Embodied AI — 가사, 요리](#seeed-embodied-ai-hackathon--가사와-요리-로봇) | 2025-10 선전, 마운틴뷰 | SO-ARM101, Jetson Thor(제공) | 말차 만들기, 설탕 뿌리기, 셔츠 개기 |
| [AMD Open Robotics Hackathon](#amd-open-robotics-hackathon) | 2025-12 도쿄, 파리 | SO-101, 클라우드 GPU(제공) | 도넛 포장 자동화, Connect 4 로봇 |
| [한성대 × 로보시지 제1회](#한성대--로보시지-제1회-physical-ai-해커톤) | 2026-02 서울 | SO-ARM 양팔(제공) | 3종목(색 분류, 정밀 포장, 접기) |
| [창원대 전국 대학생 피지컬AI](#창원대-전국-대학생-피지컬ai-해커톤) | 2026-02 창원 | SO-101 | 물체 5개 바구니 넣기 랩타임 |
| [LeHome Challenge (ICRA)](#lehome-challenge-2026) | 2026-02~06 온라인, 빈 | SO-ARM101 양팔 | 의류 4종 개기 |
| [Cook with reBot](#seeed-studio-cook-with-rebot) | 2026-04 선전 | reBot B601-DM(제공) | 계란 깨서 굽기 |
| [로보틱어스 제1회 로봇 해커톤](#로보틱어스-제1회-로봇-해커톤) | 2026-08 대전 | 구동기 6축, Jetson AGX(제공) | 아기 요람 로봇, 머리 따라가는 폰 팔 |
| [PAC 2026 피지컬 AI 챌린지](#pac-2026-피지컬-ai-챌린지) | 2026-10 대구 | PiPER, SO-101(제공) | 사과 등급 분류 등 기업 미션 |

## 해외

### Seeed × Hackster Embodied AI Hackathon

- 2025-03-22~23, 미국 마운틴뷰 Circuit Launch(GTC 2025 주말). Seeed Studio, Hugging Face, NVIDIA, Hackster.io. 규모는 출처마다 다르다(행사 페이지 참석 116명, Seeed 영상 설명 「약 150명 지원, 30명 가까운 개발자」).
- **방식**. 주최가 SO-ARM100 키트, Jetson Orin NX, 카메라와 마이크를 제공했다. 자유 주제이고 LeRobot 사용이 필수였다. 문서 30, 영상 30, 코드와 기여 20, 창의성 20으로 채점했다.
- **1위**. SO-100 두 쌍으로 **양팔 협업 그릇 옮기기**. 공개된 지 사흘 된 GR00T N1을 양팔용으로 고쳐 미세조정했고 ACT와 Pi0도 실험했다. 남긴 교훈은 「Calibration is Important!!!」.
{% include youtube.html id="QvzhsDliGII" title="Seeed Embodied AI Hackathon San Jose" caption="Seeed Studio 공식 영상(2025-04-17, 6분 43초). 36시간 동안의 개발과 데모" %}

- 출처. [대회 페이지](https://www.hackster.io/contests/embodiedAI), [수상 발표](https://www.hackster.io/news/embodied-ai-hackathon-winners-announced-2dc69c76942e), [1위 글](https://www.hackster.io/firebreathing-rubber-duckies/running-lerobot-so-100-arm-on-nvidia-isaac-gr00t-n1-458189), [1위 코드](https://github.com/JChunX/apple_pie/tree/seeed_hacks)

### Mistral AI Robotics Hackathon

- 2025-04-11~13, 파리. Entrepreneurs First 주최, Mistral AI가 모델과 심사, Hugging Face가 로봇팔 40대 이상과 멘토 지원. 정원 100명, 5인 팀, 48시간.
- **방식**. 자유 주제(Mistral 모델 활용). 데이터셋과 2분 영상을 Hugging Face에 올리고 피치로 심사.
- **2위 LeCopain**. 동물 캐릭터로 **「Guess Who?」 게임을 하는 로봇**. 음성을 Whisper로 받아 적고, Mistral 소형 모델이 보드를 보고 「제거할 동물」을 정하고, **목표 칸 위치를 조건으로 받는 ACT 정책 하나**가 카드를 넘긴다. 시연 96개.
- 다른 팀 과제(데이터셋 이름 기준). 그림 그리기, 피아노, 캔 쌓기, 물 붓기, 접시 닦기, 공 쌓기.
{% include youtube.html id="A4-CyfDBj3o" title="Mistral AI Robotics Hackathon" caption="행사 스케치 영상(EPYTOME, 2025-04-25, 3분 45초). 설명란 기준 「20 teams. 100 talents. 30 hours.」" %}

- 출처. [Luma](https://luma.com/roboticshack), [Hugging Face 조직](https://huggingface.co/roboticshack), [LeCopain 블로그](https://huggingface.co/blog/Beegbrain/guess-who-so100-mistral), [LeCopain 코드](https://github.com/alexcbb/LeCopain)

### LeRobot Worldwide Hackathon

- 2025-06-14~15, 온라인과 전 세계 로컬 거점 동시 개최. Hugging Face 주최. 규모는 출처마다 다르다(「45개국 2,500명 이상, 600개 이상 팀」, 「44개국 3,000명 이상 등록」). 데이터셋 약 190개.
- **방식**
  - 본부는 장비를 주지 않았다. 리더와 팔로워 로봇(SO-100, SO-101, Koch, LeKiwi), 카메라 여러 대, 로컬 GPU나 Colab이 필수였다. 로컬 주최가 빌려주기도 했다(뮌헨은 SO-101 50대 이상).
  - 트랙은 모방학습(「ACT로 시작하고 여유가 있으면 SmolVLA」), 강화학습, 새 로봇 통합, 하드웨어 개선, 데이터셋 도구.
  - 1분 미만 영상과 데이터셋을 제출하면 Hugging Face가 창의성, 기술 난이도, 사용성, 현실 영향으로 30개를 고르고 커뮤니티 투표로 순위를 정했다.
- **결과물** (순위는 수상작 영상 파일명 기준)

| 순위 | 팀 | 한 일 |
|---|---|---|
| 1 | leChef | SO-100에 **좌우 이동 레일**을 달아 샌드위치 재료 5단계 쌓기. 시연 199개, ACT 하나로 학습 |
| 2 | ez_2_ai | 양팔 SO-100으로 **셔츠 개기**(시연 51개, 카메라 4대), 약 분류 |
| 4 | Electrify | 배터리 끼우기, 악어 클립 집기 |
| 8 | SeeNGrip (서울) | 색에 반응해 집어 꽂기. 아래 서울 절 |
| 9 | MOS (서울) | 모기와 나방 잡기 |
| 13 | LeCyborg | 팔에 **근전도(EMG) 센서**를 붙였다 |
| 20 | ACE (KAIST, 대구) | SmolVLA로 두 팔이 공중에서 물건 주고받기 |

{% include figure.html src="assets/images/hackathons/lechef-episode.jpg" alt="1위 leChef 팀의 시연 에피소드 장면. 위 줄은 위쪽 카메라로 본 재료 칸과 접시, 아래 줄은 손목 카메라로 본 빵 집기" caption="1위 leChef의 시연 데이터 한 에피소드(20초)를 넷으로 나눈 장면. 위는 위쪽 카메라, 아래는 손목 카메라. 재료 칸에서 빵을 집어 접시에 놓는다. 출처 Hugging Face 데이터셋 LeRobot-worldwide-hackathon/22-leChef-leChef_dataset (Apache-2.0)" %}

{% include youtube.html id="28-14kJCufY" title="LeChef - Hackathon LeRobot Worldwide" caption="1위 leChef 팀의 제출 영상(2025-06-15, 1분 9초)" %}

{% include youtube.html id="FLxFBU-Kodk" title="What can you build during 48h Robotics Hackathon?" caption="Hugging Face 공식 1주년 회고 영상(2026-06-22, 7분 27초). 셔츠 접기부터 레고 분류 공장까지 수상작을 모아 보여 준다" %}

- 첫날 접속이 몰려 Hugging Face 서버가 멈췄다. 한 참가자는 「a lot of things go wrong and it's usually not clear why」라고 남겼다.
- 출처. [Hugging Face 조직](https://huggingface.co/LeRobot-worldwide-hackathon), [과제 안내 PDF](https://huggingface.co/spaces/LeRobot-worldwide-hackathon/README/resolve/main/Challenges.pdf), [수상작](https://huggingface.co/spaces/LeRobot-worldwide-hackathon/all-winners), [미시간대 후기](https://robotics.umich.edu/news/2025/hackathon-qa-brouze), [We broke Hugging Face](https://robotsandstartups.substack.com/p/sad-face-we-broke-hugging-face)

### Seeed Embodied AI Hackathon — 가사와 요리 로봇

- 2025-10-18~19 선전, 10-25~26 마운틴뷰. Seeed Studio, NVIDIA, Hugging Face. 「Over 700 developers registered, and more than 30 teams」.
- **방식**. 테마는 「Home Task and Cooking Robots」. 아이디어를 먼저 내는 신청제. 주최가 SO-ARM101, StarAI 팔, Jetson AGX Thor를 제공했다. 권장 흐름은 시연 150개 이상 수집, ACT, Diffusion Policy, GR00T N1.5, SmolVLA 중 하나로 학습, Jetson Thor 배포.
{% include youtube.html id="Y2ca3on6dd8" title="Over 100 Contestants Joined Our Embodied AI Hackathon!" caption="Seeed Studio 현장 영상(1분 27초). 양팔 조작, 천 접기, 여러 모델 협업 장면이 나온다" %}

- **결과물**
  - 미국 1위 **Matcha Bot**. 양팔 XLeRobot으로 말차 붓기, 물 붓기, 휘젓기. 하위 과제마다 시연 약 30개, GR00T N1.5. 모델이 지난 동작을 기억하지 못해 **장면에 문맥을 새겼다**(다 부은 용기는 떨어뜨리고, 그릇 상태가 눈으로 구분되게).
  - 미국 2위 **Sprinkle Robot**. 설탕을 뿌리고 버튼으로 접시를 돌린다. SmolVLA 시연 170개, 긴 과제를 **잡기, 기울이기, 누르기, 놓기 네 모델로 쪼갰다.**
  - 미국 3위. 셔츠 개기. 하루 반 만에 시연 수집과 시뮬레이션 시나리오, 학습된 보상 함수로 오류 회복.
  - 중국 1위. 펜과 지우개 모으고 책상 닦기. GR00T N1.5, 시연 300개(실물 90%, 시뮬레이션 10%).
{% include youtube.html id="mr07jcbbZc8" title="Embodied AI Hackathon 2025 Mountain View" caption="마운틴뷰 행사 영상(Solo Tech, 2025-11-07, 2분 8초). 설명란 기준 350명 이상, 20팀 이상. 말차 로봇 등이 나온다" %}

- **막힌 곳**. 현장에서 카메라 하나가 단락됐다. Jetson에 USB 2.0 카메라 3대 이상을 붙이기가 매우 어려웠다. LeRobot 데이터셋 형식을 다른 모델용으로 직접 변환해야 했다.
- 출처. [회고](https://www.seeedstudio.com/blog/2025/11/06/2025-embodied-ai-hackathon-recap-we-built-home-cooking-robot/), [Matcha Bot](https://www.hackster.io/sigrobotics/matcha-bot-sigrobotics-embodied-ai-hackathon-1st-place-f0e520), [중국 1위 코드](https://github.com/Lee-LEO-H/Lerobot-GR00TN1.5), [영상](https://www.youtube.com/watch?v=Y2ca3on6dd8)

### AMD Open Robotics Hackathon

- 2025-12-05~07 도쿄(100명 36팀), 12-12~14 파리(72명 25팀). AMD, Hugging Face, Data Monsters. 2~4인 팀.
- **방식**
  - 주최가 조립된 SO-101, 추론용 노트북, 팀별 클라우드 GPU(MI300X)를 제공했다.
  - **미션 1**(1일차, 채점 안 함). 강사 지도로 LeRobot 설치와 집기 놓기.
  - **미션 2**(2일). 자유 주제, 100점 채점. 공식 README 템플릿(미션 설명, 창의성, 기술 구현, 사용 편의)과 학습 기록을 담은 GitHub 저장소를 제출했다. 수상팀은 코드, 데이터셋, 모델, 영상 공개가 의무였다. 도시별 1위 1만 달러.
- **결과물**
  - 도쿄 1위. **도넛 가게 테이크아웃 포장**. 주문 챗봇 → 메시지 큐 → 양팔 로봇. SmolVLA, 학습 시연 120개(실패 포함 180개 이상 수집). 과제를 초코 도넛, 딸기 도넛, 뚜껑 닫기 셋으로 나눴다. 모델이 끝을 판단하지 못해 **USB 종을 쳐서 완료를 알렸다.**
  - 도쿄 2위(쿠후샤). **파스타를 삶아 담고 핸드벨로 다 됐다고 알리는** 로봇. 사람 동작을 모방학습해 조리 동작과 벨 울리기를 익혔다.
  - 파리 3위(3위는 도시마다 5팀). **Connect 4(사목) 상대 로봇**. 비전으로 판을 읽고 게임 엔진이 수를 정하고 SmolVLA가 말을 놓는다.
  - 파리 3위 Tihado(Team 13) **EatAble**. 팔을 들기 어려운 사람이 먹고 싶은 것을 말하면 로봇이 찾아 집어 입에 넣어 주는 식사 보조 로봇.
  - 그 밖에 에어하키(pi0.5), 음성 지시 보조 장치, 다음 공구를 예측해 건네는 보조 시스템.

{% include youtube.html id="7p45LBK-4oE" title="AMD Open Robotics Hackathon in Tokyo 1st prize demo" caption="도쿄 1위 도넛 포장 로봇 데모(팀원 채널, 2025-12-20, 2분 6초). 웹 주문에 따라 SmolVLA가 도넛을 상자에 담는다" %}

{% include youtube.html id="qcOxWQDa9SU" title="AI 로봇이 파스타를 삶는다 (LeRobot / AMD Robotics Hackathon)" caption="도쿄 2위 파스타 로봇(쿠후샤 채널, 2026-02-04, 1분 43초)" %}

{% include youtube.html id="Mj4wDKEM4vM" title="Carrot - 3rd place winner at AMD Open Robotics Hackathon in Paris" caption="파리 3위 EatAble 식사 보조 로봇(팀원 채널, 2025-12-14, 1분 15초)" %}
- **막힌 곳**. 서보 ID 누락, 물체 표면의 조명 반사, 노출 설정이 먹지 않음, 학습 시간 부족으로 모델 교체(「Done is better than perfect」). 공식 FAQ에 따르면 학습 중 영상 디코딩 오류는 **녹화를 Ctrl+C로 끊어 영상 파일이 손상**된 경우가 가장 흔하다. 카메라가 흔들리면 USB 포트나 허브를 나눈다.
- 출처. [AMD 회고](https://www.amd.com/en/developer/resources/technical-articles/2025/amd-open-robotics-hackathon-recap.html), [안내 저장소](https://github.com/ROCm/AMD_Hackathon/tree/main/robotics/robotics_2025), [제출 템플릿](https://github.com/AlexHe99/AMD_Robotics_Hackathon_2025_ProjectTemplate), [도쿄 1위](https://github.com/masato-ka/GreateAkihabra_9_AMDOpenRoboticsHackathon), [파리 3위 Connect 4](https://github.com/jgorostegui/AMD_Robotics_Hackathon_Team15), [파리 3위 EatAble](https://github.com/tihado/AMD_Robot_Hackathon), [참가 후기(일본어)](https://zenn.dev/mkj/articles/317e39955e1343)

### Seeed Studio Cook with reBot

- 2026-04-25~26, 중국 선전. Seeed Studio. 48시간, 50명 이상 7팀.
- **방식**. 팀마다 reBot Arm B601-DM, Jetson Orin NX, Orbbec Gemini2 깊이 카메라, 주방 작업대를 줬다. 정해진 미션은 「로봇팔이 요리 한 접시를 혼자 완성하기」. 현장 영상에서는 ACT와 카메라 세 대를 썼다고 했다.
{% include youtube.html id="3W_z89ngXDo" title="48-hour reBot Arm Hackathon" caption="Cook with reBot 현장 영상(3분 4초). 볶음 동작 훈련과 팀별 발표" %}

- **결과물**. 소프트 그리퍼와 힘 제어로 **계란 깨서 굽기**, 도구 바꿔 쥐기, 쏟지 않고 붓기.
- **주최 정리**. 세밀한 조작, 힘 제어, 정해지지 않은 환경에서의 강건함이 아직 약하다. 재료가 시뮬레이션과 다르게 움직이고 소스 농도가 바뀌었다.
- 출처. [Seeed 블로그](https://www.seeedstudio.com/blog/2026/05/08/when-robotic-arms-learned-to-cook-a-48-hour-hackathon-story/), [영상](https://www.youtube.com/watch?v=3W_z89ngXDo)

### LeHome Challenge 2026

- 온라인 시뮬레이션 2026-02~04, 실기 결선 2026-06-02(ICRA 2026, 빈). 학계 조직위와 Lightwheel.
- **방식**. SO-ARM101 양팔과 카메라 3대로 긴소매, 반소매, 긴바지, 반바지를 갠다. 시뮬레이션은 자동 판정(종류당 20벌, 본 옷 10과 처음 보는 옷 10), 실기는 부분 점수. 온라인 62팀, 결선 8팀.
- **결과**. 실기 1위 895점, 2위 865점, 3위 762.5점. 시뮬레이션 1위 팀의 성공률은 79.63%였다. 시뮬레이션 모델을 실물에 그대로 옮기는 것은 실패했고, 이미지 크기를 줄이는 방식만 달라도 성공률이 크게 떨어졌다.
{% include youtube.html id="mTohakalKz8" title="How I Beat 61 Teams at Robot Laundry Folding in Simulation (with RL)" caption="시뮬레이션 1위, 실기 2위 참가자의 해설 영상 1부(2026-07-19, 1시간 17분). 양팔 SO-ARM101로 옷 네 종류를 개는 과제와 강화학습 적용" %}

- 출처. [공식](https://lehome-challenge.com), [2위 팀 논문](https://huggingface.co/papers/2606.27163)

### 그 밖의 해외 행사

- **Physical AI Hack World Tour SF** (2026-05). 300명, 장비 현장 제공. 주최가 과제를 지정했다(토스트 굽기, QR 코드 스캔, 식탁 차리기). 결과 미확인. [Luma](https://luma.com/0xbcm3kj)
- **Revolute Boston Physical AI Hackathon** (2026-08-01~02). 정원 30명, reBot B601-RS, 테마는 요리. 과학전람회처럼 심사위원이 테이블을 돌았다. 결과 미확인. [공식](https://revolutehack.com)
- **Europe Embodied 2026** (2026-06, 뮌헨). 트랙 셋 중 하나가 산업용 로봇팔. 종합 1위는 무게 같은 물리 성질을 VLM 로봇의 입력으로 넣은 팀. [TUM](https://tum-international.com/europe-embodied-2026-48-hour-hackathon/)
- **온라인 행사**. [LabLab AI Meets Robotics](https://lablab.ai/blog/ai-meets-robotics-hackathon-summary)(2026-02, 1위 책 읽어주는 로봇팔), [AI Infra Summit](https://lablab.ai/ai-hackathons/ai-infra-summit-hackathon)(2026-09, 시뮬레이션에서 SO-101 두 대로 식탁 차리기).

## 국내

### LeRobot Worldwide 서울과 대구

**서울** (2025-06-14~15, SK mySUNI 그랑서울)
- 로봇 지참이 원칙이었고 최대 50명. 글로벌 제출과 별도로 서울 현장 피치를 했다.
- **SeeNGrip — 서울 1등, 글로벌 8위.** 휴대폰 화면으로 색을 보여 주면 그 색의 판을 집어 핀에 꽂는다(「오징어 게임 데모」). 그리퍼와 카메라를 직접 만들었다. 호스트 후기 기준 「ACT, 50에피소드」, 성공률은 「체감상 90퍼센트 정도」. 공개 데이터셋은 SO-101, 시연 50개, 카메라 2대.
- **MOS — 글로벌 9위.** 로봇 두 대에 잡기와 버리기 모델을 따로 써서 모기와 나방 잡기.
- **AI 선풍기 — 글로벌 25위.** 얼굴을 따라가며 부채질.
{% include figure.html src="assets/images/hackathons/seengrip-episode.jpg" alt="SeeNGrip 팀의 시연 에피소드 장면. 위 줄은 휴대폰 화면이 빨간색일 때 로봇이 빨간 삼각형 판을 집어 가운데 핀에 꽂는 모습, 아래 줄은 같은 순간의 손목 카메라" caption="서울 1등 SeeNGrip의 시연 데이터 한 에피소드(15초)를 넷으로 나눈 장면. 왼쪽 위 휴대폰 화면이 빨간색이 되면 빨간 삼각형 판을 집어 가운데 핀에 꽂는다. 위는 노트북 카메라, 아래는 손목에 단 휴대폰 카메라. 출처 Hugging Face 데이터셋 LeRobot-worldwide-hackathon/201-SeeNGripandBigBrothers-SquidGameSeeNGrip (Apache-2.0)" %}

{% include youtube.html id="WzuDLdXBKHU" title="Hugging Face LeRobot Hackathon SEOUL #1 SeeNGrip" caption="SeeNGrip 팀 데모 영상(2025-06-20, 1분 1초)" %}

{% include youtube.html id="HgN0qIFSd8I" title="허깅페이스 르로봇 글로벌 해커톤, Physical AI 가 진짜 온다" caption="서울 호스트 수도리무브의 현장 영상(2025-06-19, 16분 56초)" %}

- 순위 밖에서는 SmolVLA로 「왼쪽 위 초록 공 집어」 같은 명령 따르기(집기는 불완전), **13시 데모는 성공하고 17시 데모는 실패**한 서랍 열고 사탕 담기 등이 있었다.
- 호스트 교훈. 「확실한 성공사례」 하나가 전체의 기준점이 됐다. 몇 시간 뒤 같은 것이 안 되는 재현성 문제가 있었다. 멀쩡한 로봇도 부러져 **예비 3D 프린트 부품**이 유용했다. 영상 평가라 영상에 들인 시간이 결과에 영향을 줬다.
- 출처. [호스트 후기 1](https://sudormrf.run/2025/06/24/huggingface-lerobot-hackathon-review/), [호스트 후기 2](https://jonhpark7966.github.io/lerobot-hackathon-seoul-2025/), [SeeNGrip 데이터셋](https://huggingface.co/datasets/LeRobot-worldwide-hackathon/201-SeeNGripandBigBrothers-SquidGameSeeNGrip)

**대구** (2025-06-14~16, 영남일보)
- 6개 대학 12팀 41명, **SO-101 지급**. 주제는 「산업과 일상의 자동화 로봇」.
- KAIST 팀이 SmolVLA로 **두 팔이 공중에서 물건을 주고받는** 과제로 글로벌 20위를 했다. 그 밖에 배변패드 교체, 신발장 정리, 자연어 지시 피킹, 얼굴 따라가는 폰 거치대, 와인잔 닦기.
{% include youtube.html id="KzXUnjyROz8" title="LeRobot 해커톤 대구 현장" caption="영남일보TV 현장 영상(2025-07-01, 19분 50초). 영남일보 대강당에서 무박 3일, 진행 시간 32시간 동안의 이야기" %}

- 교훈. 일주일 전에 받아 조립했는데 그사이 LeRobot이 바뀌어 처음부터 다시 한 팀이 있었다. 리더와 팔로워 캘리브레이션을 따로 해야 해서 헤맸다.
- 출처. [영남일보](https://www.yeongnam.com/web/view.php?key=20250616028496144), [영상](https://www.youtube.com/watch?v=KzXUnjyROz8), [KAIST](https://ee.kaist.ac.kr/en/research-achieve/ee-prof-dong-eui-changs-team-wins-third-prize-at-hugging-face-lerobot-worldwide-hackathon-for-developing-vla-based-collaborative-robot-object-transfer-system/)

### POSCO 산업용 AI-로봇 경진대회

- 2025-09-09 본선, 포스코센터. 32개 대학 84팀 지원, 본선 7팀. 로봇은 주최가 제공했고 준비 기간에도 쓸 수 있었다.
- 협동로봇 미션은 열처리 용기를 모사한 **불량 블록을 정상 블록으로 교체**하기. 협동로봇 두 대, 빠를수록 고득점.
- 대상 팀은 토크센서와 비전센서, 자체 시뮬레이터의 강화학습과 충돌 예측을 썼다. 모방학습이 아닌 **전통 제어 중심** 사례.
- 출처. [AI타임스](https://www.aitimes.kr/news/articleView.html?idxno=36434)

### 한성대 × 로보시지 제1회 Physical AI 해커톤

- 2026-02-07~08, 한성대. 80여 명 20팀. SO-ARM 100/101 두 대로 만든 양팔.
- **3종목을 현장에서 공개**하고 팀이 골랐다. Tri-Color Classifier(색 분류), Precision Packing(정밀 포장), Fine Folding(접기). 종목별로 시상했다. 수상팀과 채점 기준은 미확인.
{% include youtube.html id="fi2axVPA7DA" title="제1회 Physical AI 해커톤 대회, 한성대 × 로보시지" caption="한성대 × 로보시지 해커톤 현장 영상(14분 25초). 팀별 흰 칸막이 부스, 보라색 SO-ARM 양팔, 밤샘 작업과 시상" %}

- 현장 영상에는 카메라 해상도와 프레임이 맞지 않아 데이터셋을 버리고, 하룻밤에 시연 23개밖에 못 모은 팀이 나온다.
- 출처. [대학저널](https://dhnews.co.kr/news/view/1065570802488898), [영상](https://www.youtube.com/watch?v=fi2axVPA7DA)

### 창원대 전국 대학생 피지컬AI 해커톤

- 2026-02-07~08. 전국 10팀 30여 명, 예선과 본선.
- SO-101로 「2종 5개 물체를 제한 시간 안에 정해진 곳으로」 옮기고, **5개를 모두 넣는 랩타임으로 순위**를 정했다.
- 대상 팀은 데이터를 많이 모아 동작을 안정시키고, 인식이 약한 구간의 데이터를 반복해 보강하고, **동작 단위가 아니라 전체 과정을 하나의 데이터셋으로** 구성했다.
- 출처. [대학저널 1](https://dhnews.co.kr/news/view/1065573908672189), [대학저널 2](https://dhnews.co.kr/news/view/1065580430979563)

### 로보틱어스 제1회 로봇 해커톤

- 2026-08-03~08, KAIST. 학생 비영리단체 로보틱어스 주최. KAIST와 서울대 각 5팀 30명, 2일 교육 뒤 나흘 해커톤(합숙 100시간).
- 팀마다 구동기 6축과 Jetson AGX를 받아 로봇 자체를 만들었다. 공통 미션은 「실생활에서 사람보다 효율적으로 쓰일 로봇」.
- 최우수는 아기 요람 로봇, 우수는 팔 끝 휴대폰이 사용자 머리 방향을 따라가는 로봇팔. **10팀 저장소와 주최측 가이드가 모두 공개**돼 있다.
{% include youtube.html id="WTTLViPGILA" title="로보틱어스 100시간 해커톤" caption="충청투데이 취재 영상(2026-08-21, 7분 39초). 팀별로 만든 로봇을 보여 준다" %}

- 출처. [행사 페이지](https://robotic-us.com/events/robot-hackathon-2026), [GitHub](https://github.com/robotic-us)

### PAC 2026 피지컬 AI 챌린지

- 2026-10-09~10, 경북대 크리에이티브파크. 대구시 주최. 지원 147팀 531명, 본선 59팀 206명(로보틱스 미션 21팀, IR 피칭 38팀). 대상은 경북대 Yard-X팀이고 21개 팀이 수상했다. 대상팀의 결과물은 미확인.
- **로보틱스 미션** (공식 페이지 기준)

{% include figure.html src="assets/images/hackathons/pac2026-missions.svg" alt="PAC 2026 로보틱스 미션 네 가지. 사과 선별, 칸막이 포장, 비닐 뜯어 접기, 자율주제의 기본 과제와 통과 기준" caption="PAC 2026 로보틱스 미션 네 가지(공식 페이지 내용을 바탕으로 그림)" %}

| 미션 | 기본 과제 | 통과 기준 | 장비 |
|---|---|---|---|
| 사과 선별 | 트레이 위 사과 5개를 비전으로 찾아 색 기준 두 등급으로 상자 2개에 적재 | 5개 중 4개 이상 | PiPER |
| 칸막이 포장 | 3×3 파티션 상자의 빈 칸에 완충 포장 블록 5개를 하나씩 넣기 | 5개 중 4개 이상 안착, 파티션 무너짐 없음 | PiPER |
| 비닐 뜯어 접기 | 롤 비닐을 당겨 절취선에서 뜯고 접어 15×15cm 안에 넣기 | 3회 중 2회 이상, 10초 유지 | SO-101 |
| 자율주제 | 문제 정의서(무엇을, 왜, 어디까지)가 기본 과제를 대신하고 심사위원이 난이도를 따로 평가 | — | SO-101 |

- 미션마다 **확장 방향**을 따로 적었다(예. 3등급 분류, 여러 면 검사, 손상 방지의 정량 근거, 애매한 사과 따로 빼기). 기본 과제로 바닥을 정하고 확장으로 차이를 내는 구조다.
{% include youtube.html id="TwFH4eh-4QA" title="PAC 2026 글로벌 AI 로봇 해커톤 참가 모집" caption="참가 모집 영상(스마트크리에이터, 2026-09-22, 1분)" %}

- 출처. [공식](https://ainnov.co.kr/pac2026), [경북매일 결과 기사](https://www.kbmaeil.com/article/20261011500321)

## 결과물 경향

**많이 나온 과제**

| 묶음 | 예 |
|---|---|
| 요리, 음료 | 샌드위치 쌓기, 말차, 설탕 뿌리기, 도넛 포장, 계란 굽기, 바텐더 |
| 천 다루기 | 셔츠 개기, 수건 개기, 의류 4종. 주최가 「상급 과제」로 내는 경우가 많다 |
| 조건 보고 집어 옮기기 | 색 분류, 사과 등급 분류, 무작위 물체 바구니에 넣기, 약 분류 |
| 생활 정리 | 신발장, 양말, 펜과 지우개 모으고 책상 닦기 |
| 게임 | Guess Who, Connect 4, 에어하키 |
| 사람 보조 | 정비 공구 건네기, 다음 공구 예측, 책 읽어주기, 얼굴 따라가는 선풍기 |
| 하드웨어 확장 | 이동 레일, 근전도 센서, 직접 만든 그리퍼와 카메라 |

**시연 데이터 규모** (원문에 숫자가 있는 것)

| 결과물 | 시연(에피소드) |
|---|---|
| 근전도 센서 팔 | 20 |
| 말차 만들기 | 하위 과제마다 약 30 |
| 색 반응 집어 꽂기 | 50 |
| 셔츠 개기(LeRobot 2위) | 51 |
| Guess Who | 96 |
| 도넛 포장 | 120 (수집 180 이상) |
| 설탕 뿌리기 | 170 |
| 샌드위치 쌓기 | 199 |
| 책상 정리와 닦기 | 300 |

**잘된 것**

{% include figure.html src="assets/images/layered.svg" alt="사람의 요청을 LLM이나 챗봇이 해석해 무엇을 할지 정하고, ACT나 SmolVLA가 로봇팔을 움직이는 구조와 해커톤 사례 세 가지" caption="해커톤 결과물에서 반복된 구조. 위에서 무엇을 할지 정하고, 아래에서 학습된 동작이 움직인다" %}

- **짧은 단일 과제를 ACT 50개 안팎으로.** 하루 안에 확실히 됐다.
- **긴 과제를 하위 정책으로 쪼개기.** 설탕 뿌리기는 네 모델, 도넛 포장은 세 과제로 나눴다. 반대로 하나의 ACT로 5단계를 해낸 샌드위치, 목표 위치를 조건으로 넣은 Guess Who도 있다.
- **과제 끝을 장면에 새기기.** 다 쓴 용기 떨어뜨리기, 종 치기.
- **LLM이나 규칙 엔진이 위, 학습된 동작이 아래.** Guess Who(LLM), 도넛 포장(주문 챗봇과 메시지 큐), Connect 4(게임 엔진), 음성으로 공구 건네기.
- **하드웨어 개선의 효과가 컸다.** 이동 레일, 직접 만든 그리퍼와 카메라.

**막힌 것**
- **짧은 행사에서 VLA 계열은 자주 실패했다.** 적은 데이터와 짧은 학습, 행사 중 끝나지 않은 대형 모델 학습.
- **재현성.** 낮에 되던 동작이 몇 시간 뒤 실패.
- **카메라.** 해상도와 프레임 불일치, 단락, 노출 설정, 조명 반사, USB 대역폭.
- **소프트웨어 버전.** 행사 직전 LeRobot 변경, 막 공개된 모델 코드, 데이터셋 형식 변환.
- **녹화 중단으로 영상 파일 손상.**
- **조립, 캘리브레이션, 부품 파손.**
- **연산 자원.** 노트북으로는 부족해 대부분 클라우드 GPU를 썼다.
- **성공률 숫자가 거의 남지 않는다.** 영상, 발표, 투표 심사가 대부분이라 숫자가 남은 것은 정량 경진, 통과 기준, 랩타임 정도다.

## 기획할 때 참고할 점

- **첫날 공통 미션.** AMD처럼 모두가 같은 집기 놓기를 먼저 해 보면 장비 문제를 초반에 걸러 낼 수 있다.
- **통과 기준과 확장 방향을 나눠 적기.** PAC처럼 「5개 중 4개 이상」 같은 바닥을 두고, 확장으로 차이를 내게 한다.
- **성공률을 규칙에 넣기.** 「같은 조건에서 N번 시도해 성공 횟수」를 세면 발표 실력이 아니라 결과물로 겨룰 수 있다.
- **결과를 남기는 제출물.** 짧은 영상과 Hugging Face 데이터셋(LeRobot), 정해진 README 템플릿과 GitHub 저장소(AMD), 팀 저장소 모음(로보틱어스).
- **운영 준비.** 예비 부품, 소프트웨어 버전 고정, 캘리브레이션 절차, 녹화를 강제로 끊지 않기, USB 포트 나누기, 조명 통제. 자세한 것은 [프로젝트 체크리스트](playbook.html).
