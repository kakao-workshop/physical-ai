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

## 로컬 미리보기

GitHub Pages와 같은 `github-pages` gem으로 빌드합니다. Ruby 3.x가 필요합니다.

```bash
bundle config set --local path vendor/bundle
bundle install
bundle exec jekyll serve
# http://127.0.0.1:4000/physical-ai/
```

테마는 [Just the Docs](https://just-the-docs.com/) v0.12.0을 `remote_theme`으로 씁니다.
