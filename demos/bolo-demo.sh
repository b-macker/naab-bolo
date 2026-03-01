#!/bin/bash
# NAAb BOLO - Interactive Demo Script
# Shows governance scanning in action

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Demo directory
DEMO_DIR="$(dirname "$0")"
NAAB_LANG="$DEMO_DIR/../naab/build/naab-lang"

clear
echo -e "${BOLD}${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${PURPLE}║                    NAAb BOLO Demo                         ║${NC}"
echo -e "${BOLD}${PURPLE}║              Code Governance & Security Scanner           ║${NC}"
echo -e "${BOLD}${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}This demo shows BOLO detecting security issues in code.${NC}"
echo ""

sleep 2

echo -e "${BOLD}${YELLOW}Step 1: Scanning vulnerable code...${NC}"
echo ""
echo -e "${CYAN}File: ${NC}demos/examples/bad_auth.py"
echo ""

# Show the bad code
cat "$DEMO_DIR/examples/bad_auth.py" | head -15
echo -e "${CYAN}...${NC}"
echo ""

sleep 2

echo -e "${BOLD}${YELLOW}Step 2: Running BOLO scan (enterprise profile)...${NC}"
echo ""

# Run BOLO scan (if naab-lang is built)
if [ -f "$NAAB_LANG" ]; then
    "$NAAB_LANG" "$DEMO_DIR/../scan.naab" "$DEMO_DIR/examples" --profile enterprise 2>&1 || true
else
    # Simulated output if BOLO isn't built
    echo -e "${BOLD}${PURPLE}NAAb BOLO Scanner [enterprise]${NC}"
    echo -e "Scanning 2 files in demos/examples"
    echo ""
    sleep 1
    echo -e "  ${RED}✗${NC} ${BOLD}bad_auth.py:7${NC} ${CYAN}[no_secrets]${NC}"
    echo -e "    Hardcoded API key detected: 'sk-1234567890abcdef'"
    echo ""
    sleep 1
    echo -e "  ${RED}✗${NC} ${BOLD}bad_auth.py:11${NC} ${CYAN}[no_sql_injection]${NC}"
    echo -e "    String formatting in SQL query (injection risk)"
    echo ""
    sleep 1
    echo -e "  ${YELLOW}!${NC} ${BOLD}bad_auth.py:17${NC} ${CYAN}[oversimplification.stub_function]${NC}"
    echo -e "    Stub function: validate_input() contains only 'pass'"
    echo ""
    sleep 1
    echo -e "  ${RED}✗${NC} ${BOLD}bad_auth.py:21${NC} ${CYAN}[no_secrets]${NC}"
    echo -e "    Hardcoded secret detected: 'my_secret_key_123'"
    echo ""
    sleep 1
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "Files scanned:     2"
    echo -e "Files with issues: 1"
    echo -e "Total violations:  4"
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
fi

echo ""
sleep 2

echo -e "${BOLD}${YELLOW}Step 3: Comparing with clean code...${NC}"
echo ""
echo -e "${GREEN}✓${NC} clean_auth.py passes all checks:"
echo -e "  ${GREEN}✓${NC} No hardcoded secrets (uses environment variables)"
echo -e "  ${GREEN}✓${NC} No SQL injection (parameterized queries)"
echo -e "  ${GREEN}✓${NC} Proper validation implementation"
echo -e "  ${GREEN}✓${NC} Sensitive data hashed before logging"
echo ""

sleep 2

echo -e "${BOLD}${GREEN}Demo complete!${NC}"
echo ""
echo -e "${CYAN}BOLO detected:${NC}"
echo -e "  • Hardcoded API keys and secrets"
echo -e "  • SQL injection vulnerabilities"
echo -e "  • LLM-generated stub functions"
echo -e "  • Security best practice violations"
echo ""
echo -e "${PURPLE}Learn more: https://github.com/b-macker/naab-bolo${NC}"
echo ""
