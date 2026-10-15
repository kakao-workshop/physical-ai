---
title: 장비
nav_order: 5
description: 로봇팔 Physical AI 실습에 쓰이는 로봇팔, 카메라, 계산 장비와 참고할 만한 작은 로봇
---

# 장비
{: .no_toc }

해커톤과 공개 자료에서 쓰인 장비를 모았습니다. 가격과 사양은 적어 둔 날짜 기준이며 바뀔 수 있습니다.

1. TOC
{:toc}

## 로봇팔

| 장비 | 특징 | 쓰인 곳 |
|---|---|---|
| **SO-ARM101 (SO-101)** | LeRobot의 표준 저가 로봇팔. 3D 프린팅 부품과 서보 모터로 만든다. 리더암과 팔로워암 한 쌍으로 텔레오퍼레이션 | [한성대 × 로보시지 해커톤](hackathons.html#한성대--로보시지-제1회-physical-ai-해커톤) (팀당 두 대), [교재](start-without-robot.html) 10부 |
| **AgileX PiPER** | 리더암과 팔로워암 세트로 텔레오퍼레이션. PC와 USB-CAN(1Mbps)으로 통신. 국내에서는 위고로보틱스가 다룬다 | PAC 2026 장비 표기, [Piper + SmolVLA 데모](https://www.youtube.com/shorts/elOj2GnP7Nk) |
| **reBot Arm B601-DM** | Seeed Studio의 오픈소스 로봇팔 ([reBot-DevArm](https://github.com/Seeed-Projects/reBot-DevArm), [판매 페이지](https://www.seeedstudio.com/reBot-Arm-B601-DM-Bundle.html)) | [Seeed 요리 해커톤](hackathons.html#seeed-studio-cook-with-rebot) |
| **LeKiwi** | SO-ARM 계열 팔을 바퀴 달린 이동 베이스에 올린 오픈소스 로봇. 국내 로보시지가 「A-Go(LeKiwi)」로 판매(2026-10 스토어 표기 990,000원) | 이동하며 집는 과제 |

### 사진으로 보기

**SO-101** — 왼쪽이 실제로 일하는 팔로워암, 오른쪽이 사람이 손잡이를 잡고 움직이는 리더암입니다. 리더를 움직이면 팔로워가 같은 각도로 따라 움직입니다.

{% include figure.html src="assets/images/hardware/so101-follower-leader.jpg" alt="SO-101 팔로워암과 손잡이가 달린 리더암 사진" caption="SO-101 팔로워암(왼쪽)과 리더암(오른쪽). 출처 TheRobotStudio/SO-ARM100 저장소 media 폴더 (Apache-2.0)" %}

**reBot Arm B601** — Seeed Studio의 오픈소스 로봇팔입니다. 해외 요리 해커톤 두 곳(선전 Cook with reBot, Revolute 보스턴)에서 팀마다 한 대씩 썼습니다.

{% include figure.html src="assets/images/hardware/rebot-b601.jpg" alt="흰색과 형광 연두색의 reBot Arm 렌더 이미지" caption="reBot Arm. 출처 Seeed-Projects/reBot-DevArm 저장소 media 폴더 (CERN-OHL-W-2.0)" %}

**LeKiwi** — 옴니휠 세 개가 달린 이동 베이스 위에 SO-ARM 팔을 올렸습니다. 작업대를 떠나 옮겨 다니며 집는 과제에 씁니다.

{% include figure.html src="assets/images/hardware/lekiwi.jpg" alt="옴니휠 이동 베이스 위에 검은 SO-ARM 팔을 올린 LeKiwi 사진" caption="LeKiwi. 출처 SIGRobotics-UIUC/LeKiwi 저장소 media 폴더 (Apache-2.0)" %}

**AgileX PiPER** — 아래는 SmolVLA 모델로 공을 집어 상자에 넣는 25초 영상입니다.

{% include youtube.html id="elOj2GnP7Nk" title="Agilex Piper with SmolVLA" vertical=true caption="AgileX PiPER가 SmolVLA로 공을 집어 상자에 넣는 장면(25초)" %}

### PiPER Studio

[WeGo-Robotics/wego-piper-web](https://github.com/WeGo-Robotics/wego-piper-web)은 LeRobot 기반 로봇팔을 웹 화면에서 다루는 도구입니다(Apache-2.0, 2026-10-15 README 기준).

- 장치 등록, 데이터 수집과 검토, 학습, 추론과 평가, MuJoCo 시뮬레이션, 별도 프로세스로 도는 비상정지 감시.
- 요구 환경. Ubuntu 22.04 이상, Docker와 Docker Compose v2. 학습과 추론에는 NVIDIA GPU(compute capability 7.5 이상). GPU가 없으면 수집, 시뮬레이션, 조종만 된다.
- 저장소에 들어 있는 PiPER 텔레오퍼레이션 모니터 화면. 리더와 팔로워 두 팔을 CAN 포트로 잡고, 관절 여섯 개와 그리퍼의 값을 나란히 보여 준다.

{% include figure.html src="assets/images/hardware/piper-teleop-monitor.png" alt="Piper Monitor 창. CAN 설정, 텔레오퍼레이션 명령, 리더와 팔로워의 관절 값 막대그래프" caption="PiPER 텔레오퍼레이션 모니터. 출처 WeGo-Robotics/wego-piper-web 저장소 vendor/lerobot_robot_piper/asset (Apache-2.0)" %}

- 웨비나에서 소개한 기능. 카메라 설정 프로파일 저장과 회색 카드 보정, 밝기와 색 변화 알림, 에피소드별 영상과 관절 궤적 동시 보기, 이미지 인코더 확인 도구, 태그로 팔 위치 비교, 원격 GPU로 추론하는 정책 서버. SO-101을 리더암 대신 쓰는 구성도 준비돼 있다.

## 카메라

| 구성 | 장비 | 출처 |
|---|---|---|
| 손목 두 대, 위에서 한 대 | 손목 Intel RealSense D405, 탑뷰 D435 | PiPER Studio 웨비나 시연 |
| 카메라 세 대 | Orbbec Gemini2 (깊이 카메라) | Seeed 요리 해커톤 |

{% include figure.html src="assets/images/hardware/so-arm-overhead-camera.jpg" alt="주황색 SO-ARM 팔로워 옆에 노랑과 검정으로 된 기둥 위 카메라 거치대" caption="팔 옆에 세우는 위쪽 카메라 거치대 예. SO-ARM 저장소에 3D 프린팅 파일이 있다. 출처 TheRobotStudio/SO-ARM100 (Apache-2.0)" %}

- 손목 카메라는 빠르게 움직이므로 **글로벌 셔터**를 권한다.
- 일반 USB 웹캠은 빛을 덜 받아 보조 조명이 필요하다. 자세한 설정은 [체크리스트](playbook.html#2-카메라와-조명) 참고.

## 계산 장비

| 용도 | 참고값 | 출처 |
|---|---|---|
| ACT, SmolVLA 추론 | RTX 4050 노트북 GPU로 충분했다 | PiPER Studio 웨비나 |
| ACT 학습 | RTX 5090에서 약 30분 | 같음 |
| SmolVLA 학습 | RTX 5090에서 약 2시간 | 같음 |
| 로봇 쪽 추론 | NVIDIA Jetson Orin NX | Seeed 요리 해커톤 |

GPU가 없으면 [로봇 없이 시작하기](start-without-robot.html#gpu가-없거나-약할-때)의 CPU, Colab 경로부터 시작한다.

## 참고할 만한 작은 로봇

로봇팔은 아니지만 같은 오픈소스 흐름에서 나온 저가 로봇입니다.

- **Microduck** ([Pollen Robotics](https://pollen-robotics.com/microduck/), [GitHub](https://github.com/pollen-robotics/microduck)). 2026-08 공개된 399달러 이족보행 로봇. 공식 저장소 코드 기준 로보티즈 Dynamixel XL330 계열 서보 15개를 쓴다. Pollen Robotics는 2025-04 Hugging Face가 인수했다.
{% include youtube.html id="RAtzEyGBGFU" title="We made a new robot." caption="Pollen Robotics의 Microduck 공개 영상(1분 26초)" %}

- **Reachy Mini** ([Hugging Face 블로그](https://huggingface.co/blog/reachy-mini)). Hugging Face와 Pollen Robotics의 데스크톱 오픈소스 로봇.

{% include figure.html src="assets/images/hardware/reachy-mini.jpg" alt="책상 위 노트북 옆에 놓인 흰색 Reachy Mini 로봇" caption="Reachy Mini. 출처 pollen-robotics/reachy_mini 저장소 docs/assets (Apache-2.0)" %}
