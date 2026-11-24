# s3onghyun/homebrew-tap

```bash
brew install --cask s3onghyun/tap/bulchimbeon      # macOS
brew install --cask s3onghyun/tap/token-yugong     # macOS 13+
brew install --cask s3onghyun/tap/edge-odyssey     # macOS 13+, Apple silicon
brew trust s3onghyun/tap && brew install --cask s3onghyun/tap/keyray   # macOS 14+, Apple silicon
brew install s3onghyun/tap/bulchimbeon-linux       # Linux
brew services start bulchimbeon-linux              # Linux: systemd 사용자 유닛
brew install s3onghyun/tap/agent-otel-kit          # macOS, Linux
```

Homebrew 7 부터는 다른 tap 의 cask·formula 를 신뢰(trust)해야 읽는다. 위처럼 `s3onghyun/tap/<이름>`
전체 이름으로 설치하면 그 하나를 저절로 신뢰하므로 위 명령은 그대로 된다. 설치 전에 `brew info` 로
먼저 보려면 `brew trust --cask s3onghyun/tap/<이름>` (tap 전체는 `brew trust s3onghyun/tap`) 을 먼저 실행한다.

| Cask | 설명 |
|------|------|
| [bulchimbeon](https://github.com/s3onghyun/bulchimbeon) | 🪖 불침번 — AI 에이전트가 일하는 동안 맥을 깨워두는 메뉴바 이등병 |
| [token-yugong](https://github.com/s3onghyun/token-yugong) | ⛰️ 우공 — Claude Code·Codex 사용 한도를 보여 주는 메뉴바 픽셀 펫 |
| [edge-odyssey](https://github.com/s3onghyun/edge-odyssey) | ⛵ 엣지 오디세이 — 화면 가장자리를 항해하는 뽀모도로, Claude Code 가 부르면 빛난다 |
| [keyray](https://github.com/s3onghyun/keyray) | ⌘ 키레이 — 키 입력·단축키를 화면에 보여 주고, AI 에이전트가 하는 일을 알리게 하는 메뉴바 앱 |

| Formula | 설명 |
|---------|------|
| [bulchimbeon-linux](https://github.com/s3onghyun/bulchimbeon#linux) | 🪖 불침번 리눅스 데몬 — AI 에이전트가 일하는 동안 잠자기를 막는다 (systemd 사용자 서비스) |
| [agent-otel-kit](https://github.com/s3onghyun/agent-otel-kit) | 📈 Claude Code·Codex·Gemini CLI·Qwen Code 텔레메트리를 로컬 OpenTelemetry 스택으로 보내는 설정·점검 CLI |

## 새 버전 반영

`token-yugong`·`edge-odyssey`·`keyray` 는 `Bump casks` 워크플로가 매일 최신 GitHub 릴리스로 올린다
(릴리스 직후라면 Actions 탭에서 `Run workflow`). 손으로 할 때:

```bash
scripts/bump-cask.sh token-yugong          # 최신 릴리스
scripts/bump-cask.sh edge-odyssey 0.3.1    # 특정 버전
```

릴리스에 `<asset>.zip.sha256` 이 함께 올라가야 한다 (token-yugong·edge-odyssey 는 release 워크플로가 올리고, keyray 는 `Keyray-<version>.dmg.sha256` 을 손으로 올린다).
