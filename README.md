# KeiAgentInit

AI 코딩 에이전트를 위한 공통 지침 시스템

## 설치 방법

```bash
# 1. Submodule 추가
git submodule add https://github.com/eightynine01/KeiAgentInit.git .agents

# 2. 심볼릭 링크 설정
.agents/scripts/setup-agents.sh --setup

# 3. 커밋
git add .gitmodules .agents AGENTS.md CLAUDE.md .cursorrules .windsurfrules .clinerules
git add .github/copilot-instructions.md .amazon-q/ .codex/ .aider.conf.yml .continue/
git commit -m "feat: KeiAgentInit submodule 추가"
```

## 업데이트

```bash
cd .agents && git pull origin main && cd ..
git add .agents && git commit -m "chore: KeiAgentInit 업데이트"
```

## 스크립트 사용법

```bash
.agents/scripts/setup-agents.sh --setup   # 심볼릭 링크 설정
.agents/scripts/setup-agents.sh --status  # 상태 확인
.agents/scripts/setup-agents.sh --clean   # 심볼릭 링크 제거
```

## 클론 시 초기화

```bash
git clone --recurse-submodules <repo-url>
# 또는
git submodule update --init --recursive
```
