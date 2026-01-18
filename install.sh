#!/bin/bash
# KeiMcpInit 설치 스크립트
# 사용법: curl -fsSL https://raw.githubusercontent.com/eightynine01/KeiMcpInit/main/install.sh | bash

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  KeiMcpInit 설치${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 현재 디렉토리가 git repo인지 확인
if [ ! -d ".git" ]; then
    echo -e "${RED}오류: 현재 디렉토리가 git 저장소가 아닙니다.${NC}"
    echo "git 저장소 루트에서 실행해주세요."
    exit 1
fi

# 1. Submodule 추가
echo -e "${BLUE}[1/4] Submodule 추가...${NC}"
if [ -d ".agents" ]; then
    echo -e "${YELLOW}  .agents 디렉토리가 이미 존재합니다. 업데이트합니다.${NC}"
    cd .agents && git pull origin main && cd ..
else
    git submodule add git@github.com:eightynine01/KeiMcpInit.git .agents 2>/dev/null || \
    git submodule add https://github.com/eightynine01/KeiMcpInit.git .agents
fi
echo -e "${GREEN}  완료${NC}"

# 2. 심볼릭 링크 설정
echo -e "${BLUE}[2/4] 심볼릭 링크 설정...${NC}"
.agents/scripts/setup-agents.sh --setup
echo -e "${GREEN}  완료${NC}"

# 3. MCP 도구 확인 (Claude Code 환경에서만)
echo -e "${BLUE}[3/4] MCP 도구 확인...${NC}"
if command -v claude &> /dev/null; then
    # context7 확인/설치
    if claude mcp list 2>/dev/null | grep -q context7; then
        echo -e "${GREEN}  context7: 설치됨${NC}"
    else
        echo -e "${YELLOW}  context7: 설치 중...${NC}"
        claude mcp add context7 -- npx -y @upstash/context7-mcp 2>/dev/null && \
        echo -e "${GREEN}  context7: 설치 완료${NC}" || \
        echo -e "${YELLOW}  context7: 수동 설치 필요${NC}"
    fi

    # keimcp 확인
    if claude mcp list 2>/dev/null | grep -q keimcp; then
        echo -e "${GREEN}  keimcp: 설치됨${NC}"
    else
        echo -e "${YELLOW}  keimcp: 미설치 - 관리자에게 토큰 요청 필요${NC}"
        echo -e "${YELLOW}  설치 명령: claude mcp add keimcp --transport sse --url https://mcp.keiailab.dev/sse --header \"Authorization: Bearer <TOKEN>\"${NC}"
    fi
else
    echo -e "${YELLOW}  Claude Code CLI 미설치 - MCP 도구 확인 스킵${NC}"
fi

# 4. 완료 메시지
echo ""
echo -e "${BLUE}[4/4] 설치 완료!${NC}"
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  KeiMcpInit 설치 완료${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "다음 명령으로 커밋하세요:"
echo -e "${BLUE}  git add .gitmodules .agents AGENTS.md CLAUDE.md .cursorrules .windsurfrules .clinerules${NC}"
echo -e "${BLUE}  git add .github/copilot-instructions.md .amazon-q/ .codex/ .aider.conf.yml .continue/${NC}"
echo -e "${BLUE}  git commit -m \"feat: KeiMcpInit 추가\"${NC}"
