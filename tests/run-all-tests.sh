#!/bin/bash
# NAAb BOLO — Run all regression test suites
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BOLO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
NAAB="$BOLO_DIR/naab/build/naab-lang"

cd "$BOLO_DIR"

if [ ! -x "$NAAB" ]; then
    echo "Error: NAAb binary not found at $NAAB"
    echo "Run: bash build.sh"
    exit 1
fi

echo "╔══════════════════════════════════════════════╗"
echo "║  NAAb BOLO — Full Regression Test Suite      ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

TOTAL_PASS=0
TOTAL_FAIL=0
SUITE_COUNT=0

run_suite() {
    local name="$1"
    local file="$2"
    echo "═══ $name ═══"
    SUITE_COUNT=$((SUITE_COUNT + 1))

    output=$("$NAAB" "$file" 2>&1) || true
    echo "$output"

    # Extract PASS/FAIL counts from output
    suite_pass=$(echo "$output" | grep -c "PASS" || true)
    suite_fail=$(echo "$output" | grep -c "FAIL" || true)
    TOTAL_PASS=$((TOTAL_PASS + suite_pass))
    TOTAL_FAIL=$((TOTAL_FAIL + suite_fail))
    echo ""
}

run_suite "Profile Tests"     "tests/test-profiles.naab"
run_suite "Scanner Tests"     "tests/test-scan.naab"
run_suite "Report Tests"      "tests/test-report.naab"
run_suite "Enforcement Tests" "tests/test-enforce.naab"
run_suite "AI Governance Tests" "tests/test-ai.naab"
run_suite "Integration Tests" "tests/test-integration.naab"

echo "╔══════════════════════════════════════════════╗"
echo "║  FINAL RESULTS                               ║"
echo "╚══════════════════════════════════════════════╝"
echo "Suites run:  $SUITE_COUNT"
echo "Total PASS:  $TOTAL_PASS"
echo "Total FAIL:  $TOTAL_FAIL"

if [ "$TOTAL_FAIL" -gt 0 ]; then
    echo "STATUS: SOME TESTS FAILED"
    exit 1
else
    echo "STATUS: ALL TESTS PASSED"
    exit 0
fi
