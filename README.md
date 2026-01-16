# KeiAgentInit

AI 코딩 에이전트를 위한 공통 지침 시스템

## 빠른 설치 (권장)

```bash
curl -fsSL https://raw.githubusercontent.com/eightynine01/KeiAgentInit/main/install.sh | bash
```

## AI Agent 자동 설치

Claude Code 세션에서 다음을 붙여넣기:

```
Install and configure by following the instructions here:
https://raw.githubusercontent.com/eightynine01/KeiAgentInit/main/AGENTS.md
```

## 수동 설치

```bash
# 1. Submodule 추가
git submodule add git@github.com:eightynine01/KeiAgentInit.git .agents

# 2. 심볼릭 링크 설정
.agents/scripts/setup-agents.sh --setup

# 3. 커밋
git add .gitmodules .agents AGENTS.md CLAUDE.md .cursorrules .windsurfrules .clinerules
git add .github/copilot-instructions.md .amazon-q/ .codex/ .aider.conf.yml .continue/
git commit -m "feat: KeiAgentInit 추가"
```

## MCP 도구 설치

```bash
# context7 (라이브러리 문서 참조)
claude mcp add context7 -- npx -y @upstash/context7-mcp

# keimcp (인프라 관리 - 토큰 필요)
claude mcp add keimcp --transport sse \
  --url https://mcp.keiailab.dev/sse \
  --header "Authorization: Bearer <TOKEN>"
```

## 업데이트

```bash
cd .agents && git pull origin main && cd ..
git add .agents && git commit -m "chore: KeiAgentInit 업데이트"
```
