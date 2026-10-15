# Physical AI 참고자료 — 카카오 공작소

카카오 공작소 동호회가 Physical AI(로봇팔, 모방학습, VLA)를 공부하며 모은 **공개 참고자료**입니다.

- 사이트: https://kakao-workshop.github.io/physical-ai/
- 동호회의 비공식 학습 자료이며 회사의 공식 입장이나 서비스와 관계가 없습니다.

## 페이지

| 파일 | 내용 |
|---|---|
| `index.md` | 홈. 어디서 시작할지, 용어 |
| `start-without-robot.md` | 로봇 없이 시뮬레이터로 시작하는 자료 |
| `playbook.md` | 프로젝트와 해커톤 준비 체크리스트 |
| `hackathons.md` | 로봇팔 Physical AI 해커톤 사례 |
| `hardware.md` | 로봇팔, 카메라, 계산 장비 |
| `videos.md` | 공개 영상 목록과 요약 |
| `changelog.md` | 업데이트 기록 |

## 자료를 더할 때 원칙

- **공개된 자료만** 넣고 출처 링크를 붙입니다.
- 넣지 않는 것. 사내 정보, 메신저 대화 내용, 개인 이름과 발언, 업체와 협의 중인 조건.
- 수치는 출처가 밝힌 값 그대로 적고 「참고값」임을 밝힙니다.
- 영상이나 글을 길게 옮기지 않고 짧게 요약합니다.
- 새로 더하면 `changelog.md`에 한 줄 남깁니다.

## 그림과 영상 넣기

- 그림은 `assets/images/`에 SVG로 두고 `figure.html` include로 넣는다. 다른 사람의 영상 화면이나 사진을 잘라 올리지 않는다.
- 유튜브 영상은 `youtube.html` include로 넣는다(인자 `id`, `title`, `start`(초), `caption`, 세로 영상이면 `vertical=true`). 임베드가 허용된 공개 영상만 쓴다.

```liquid
{% include figure.html src="assets/images/pipeline.svg" alt="대체 텍스트" caption="설명" %}
{% include youtube.html id="fi2axVPA7DA" title="제목" start=540 caption="설명" %}
```

## 사용한 공개 자료의 라이선스

- `assets/images/hackathons/lechef-episode.jpg` — [LeRobot-worldwide-hackathon/22-leChef-leChef_dataset](https://huggingface.co/datasets/LeRobot-worldwide-hackathon/22-leChef-leChef_dataset)의 에피소드 영상에서 장면을 뽑아 이어 붙였다. [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).
- `assets/images/hackathons/seengrip-episode.jpg` — [LeRobot-worldwide-hackathon/201-SeeNGripandBigBrothers-SquidGameSeeNGrip](https://huggingface.co/datasets/LeRobot-worldwide-hackathon/201-SeeNGripandBigBrothers-SquidGameSeeNGrip)의 에피소드 영상에서 장면을 뽑아 이어 붙였다. [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).
- 나머지 그림(`assets/images/*.svg`, `pac2026-missions.svg`)은 이 저장소에서 직접 그렸다. 영상은 유튜브 임베드로만 보여 준다.

## 로컬 미리보기

GitHub Pages와 같은 `github-pages` gem으로 빌드합니다. Ruby 3.x가 필요합니다.

```bash
bundle config set --local path vendor/bundle
bundle install
bundle exec jekyll serve
# http://127.0.0.1:4000/physical-ai/
```

테마는 [Just the Docs](https://just-the-docs.com/) v0.12.0을 `remote_theme`으로 씁니다.
