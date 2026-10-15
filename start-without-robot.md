---
title: 로봇 없이 시작하기
nav_order: 2
description: 실물 로봇 없이 시뮬레이터와 공개 데이터셋으로 Physical AI를 따라 해 보는 자료
---

# 로봇 없이 시작하기
{: .no_toc }

로봇팔이 없어도 시뮬레이션으로 데이터 수집부터 학습, 추론까지 전체 흐름을 먼저 겪어 볼 수 있습니다. 실물 장비를 빌리거나 사기 전에 해 두면 장비를 받은 뒤 시간을 크게 아낍니다.

1. TOC
{:toc}

## 추천 교재 — 「로봇 없이 시작하는 Physical AI 따라하기」

- 링크. [위키독스](https://wikidocs.net/book/21363) (지은이 이창근, 2026-09-22 편집본 기준). 웹에서 읽을 수 있고 e-book은 유료다.
- 예제 코드. [ady95/physicalai_tutorial](https://github.com/ady95/physicalai_tutorial)
- 본편(1~8부)은 **실물 로봇과 유료 서비스 없이** MuJoCo 시뮬레이션과 공개 데이터셋만으로 끝난다고 소개한다. CPU, Google Colab, 로컬 NVIDIA GPU 세 경로를 안내한다.
- 흐름은 가상 로봇팔 움직이기, 규칙 기반 Pick and Place, OpenCV와 YOLO로 물체 찾기, 강화학습, LeRobot과 ACT로 모방학습, SmolVLA로 자연어 명령, 최종 프로젝트 순이다. 뒤쪽에는 LLM에게 로봇을 도구로 쥐여 주는 LLM Planner(9부)와 실물 SO-101로 옮기는 과정(10부)이 있다.
- 대상은 로봇 하드웨어와 ROS 경험이 없는 소프트웨어 개발자다.

{: .tip }
같은 Pick and Place를 규칙 기반으로 먼저 만들고 그다음 ACT와 VLA로 바꾸는 구성이라, 로봇 제어와 AI가 각각 무엇을 맡는지 구분해서 이해하기 좋다.

## LeRobot 공식 문서

- [Hugging Face LeRobot 문서](https://huggingface.co/docs/lerobot/index)
- 데이터셋 형식, 지원 로봇(SO-101 등), 정책(ACT, SmolVLA 등)과 학습 명령이 정리돼 있다. Hugging Face Hub에는 다른 사람이 올린 시연 데이터셋이 많아서 로봇 없이도 데이터를 열어 보고 학습해 볼 수 있다.

## PiPER Studio 시뮬레이션 모드

- [WeGo-Robotics/wego-piper-web](https://github.com/WeGo-Robotics/wego-piper-web) (Apache-2.0)
- LeRobot 기반 로봇팔을 웹 화면에서 다루는 도구다. README에 따르면 MuJoCo 가상 로봇으로 실물 없이 시작할 수 있고, GPU가 없어도 설치해서 수집, 시뮬레이션, 조종을 해 볼 수 있다. 학습과 추론에는 NVIDIA GPU가 필요하다.
- 요구 환경은 Ubuntu 22.04 이상과 Docker(Docker Compose v2)다.

## GPU가 없거나 약할 때

- 위 교재는 CPU와 Google Colab 경로를 따로 안내한다.
- 2026-09 위고로보틱스 웨비나에서 소개한 참고값. ACT와 SmolVLA의 **추론**은 RTX 4050 노트북 GPU로도 충분했다. **학습**은 RTX 5090 기준 ACT 약 30분, SmolVLA 약 2시간이면 쓸 만한 가중치가 나왔다. 데이터 양과 과제에 따라 달라진다.

## 함께 보면 좋은 문서

- [MuJoCo 문서](https://mujoco.readthedocs.io/) — 물리 시뮬레이터
- [Ultralytics YOLO 문서](https://docs.ultralytics.com/) — 물체 검출
- [Gymnasium](https://gymnasium.farama.org/) — 강화학습 환경
