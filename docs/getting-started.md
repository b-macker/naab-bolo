# Getting Started

## Prerequisites

- **NAAb** language runtime (built from submodule)
- **Python 3.8+** (for report generation and enforcement gates)
- **CMake 3.14+** and **C++17 compiler** (for building NAAb)

## Installation

```bash
git clone --recursive https://github.com/b-macker/naab-bolo.git
cd naab-bolo
bash build.sh
```

## Quick Start

### Scan a project
```bash
./naab/build/naab-lang scan.naab /path/to/project --profile enterprise
```

### Generate a SARIF report
```bash
./naab/build/naab-lang report.naab /path/to/project --format sarif --output report.sarif
```

### Run enforcement gates
```bash
./naab/build/naab-lang enforce.naab /path/to/project --stage ci
```

### Check AI governance compliance
```bash
./naab/build/naab-lang ai-check.naab /path/to/project
```

### List available profiles
```bash
./naab/build/naab-lang bolo.naab profiles
```

## Profiles

| Profile | Description |
|---------|-------------|
| `enterprise` | All checks enabled (LLM + security + AI + quality) |
| `llm` | LLM anti-drift: oversimplification, hallucinated APIs |
| `security` | Security: secrets, injection, escalation, traversal |
| `ai-governance` | AI/ML: model attestation, rate limiting, explainability |
| `standard` | Balanced defaults for general use |

## GitHub Action

```yaml
- uses: b-macker/naab-bolo@v1
  with:
    path: ./src
    profile: enterprise
    format: sarif
```
