# KeiMcpInit

AI 코딩 에이전트를 위한 공통 지침 시스템

## 빠른 설치 (권장)

```bash
curl -fsSL https://raw.githubusercontent.com/eightynine01/KeiMcpInit/main/install.sh | bash
```

## AI Agent 자동 설치

Claude Code, Cursor, Windsurf 등에서 아래 블록을 **그대로 복사하여 붙여넣기**:

---

**다음 작업을 순서대로 실행하세요:**

1. MCP 도구 설치 확인:
   ```bash
   claude mcp list | grep -q context7 || claude mcp add context7 -- npx -y @upstash/context7-mcp
   ```

2. KeiMcpInit 설치:
   ```bash
   git submodule add git@github.com:eightynine01/KeiMcpInit.git .agents 2>/dev/null || \
   git submodule add https://github.com/eightynine01/KeiMcpInit.git .agents
   .agents/scripts/setup-agents.sh --setup
   ```

3. 설치 결과 커밋:
   ```bash
   git add .gitmodules .agents AGENTS.md CLAUDE.md .cursorrules .windsurfrules .clinerules
   git add .github/copilot-instructions.md .amazon-q/ .codex/ .aider.conf.yml .continue/
   git commit -m "feat: KeiMcpInit 추가"
   ```

4. 설치 완료 보고: MCP 도구 상태, 심볼릭 링크, 커밋 여부

---

## 수동 설치

```bash
# 1. Submodule 추가
git submodule add git@github.com:eightynine01/KeiMcpInit.git .agents

# 2. 심볼릭 링크 설정
.agents/scripts/setup-agents.sh --setup

# 3. 커밋
git add .gitmodules .agents AGENTS.md CLAUDE.md .cursorrules .windsurfrules .clinerules
git add .github/copilot-instructions.md .amazon-q/ .codex/ .aider.conf.yml .continue/
git commit -m "feat: KeiMcpInit 추가"
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
git add .agents && git commit -m "chore: KeiMcpInit 업데이트"
```
