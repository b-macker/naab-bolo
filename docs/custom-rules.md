# Custom Rules

NAAb BOLO's checks are powered by the C++ governance engine built into NAAb. The engine runs 50+ regex-based patterns across all scanned files.

## Built-in Check Categories

### LLM Anti-Drift (3 checks)
- **oversimplification** — Stub functions, trivial returns, empty implementations
- **incomplete_logic** — Functions with pass/... body, missing error handling
- **hallucinated_apis** — Calls to functions that don't exist in the language's stdlib

### Code Quality (17 checks)
- **no_secrets** — API keys, AWS credentials, tokens, passwords
- **no_pii** — Email addresses, SSN patterns, phone numbers
- **no_placeholders** — TODO, FIXME, HACK, XXX markers
- **no_dead_code** — Unreachable code after return/break
- **no_debug_code** — console.log, print() debugging, debugger statements
- **no_mock_data** — Hardcoded localhost, test data, debug flags
- **encoding_check** — Non-UTF8 files, BOM markers
- **line_length** — Configurable max line length (default: 120)
- **function_length** — Max function body lines (default: 50)
- **cyclomatic_complexity** — Branch complexity limit (default: 10)
- **no_apologetic_language** — LLM artifacts: "I apologize", "As an AI"
- **no_hardcoded_success** — Always-true validation, fake return values
- **no_code_blocks_in_comments** — Commented-out code blocks
- **schema_validation** — JSON/YAML schema compliance
- **hash_integrity** — Checksum verification
- **yaml_validation** — YAML syntax checking
- **non_functional_check** — Non-functional requirements

### Security (7 checks)
- **no_sql_injection** — String formatting in SQL queries
- **no_shell_injection** — Unsanitized subprocess/exec calls
- **no_privilege_escalation** — chmod 777, unnecessary sudo
- **no_path_traversal** — Unsanitized file path construction
- **no_exfiltration** — Suspicious outbound data transfers
- **no_information_disclosure** — Stack traces, debug info in responses
- **no_crypto_misuse** — Weak algorithms, hardcoded crypto keys

### Per-Language Checks
Each language gets tailored patterns. For example:
- **Python**: `os.system()`, f-string SQL, `eval()`, pickle deserialization
- **JavaScript**: `eval()`, `innerHTML`, prototype pollution
- **Go**: `fmt.Sprintf` in SQL, `os/exec` with user input
- **Shell**: Unquoted variables, `eval`, `chmod 777`

## Profile-Based Activation

Checks are enabled/disabled per profile. See `profiles/*.json` for the exact configuration of each profile.
