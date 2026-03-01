# NAAb BOLO - Demo Scripts

Visual demonstrations of BOLO's governance scanning capabilities.

## Quick Start

```bash
# Run the interactive demo
./bolo-demo.sh
```

The demo will:
1. Show example vulnerable code
2. Run BOLO scan with enterprise profile
3. Detect security issues (secrets, SQL injection, stub functions)
4. Display scan results with color-coded output

## Recording for README

### Option 1: Screenshot (easiest)
```bash
# Run demo
./bolo-demo.sh

# Screenshot when you see interesting output
# On Termux: Use Android screenshot (Power + Volume Down)
```

### Option 2: Terminal Recording
```bash
# Install asciinema (optional)
pkg install asciinema

# Record the demo
asciinema rec bolo-demo.cast
./bolo-demo.sh
# Press Ctrl+D when done

# Upload to asciinema.org
asciinema upload bolo-demo.cast
# Gets you an embeddable player URL
```

### Option 3: Static Output
```bash
# Capture output to file
./bolo-demo.sh | tee demo-output.txt

# Or strip colors for clean text
./bolo-demo.sh 2>&1 | sed 's/\x1b\[[0-9;]*m//g' > demo-clean.txt
```

## Files

- `bolo-demo.sh` - Interactive demo script
- `examples/bad_auth.py` - Example code with security issues
- `examples/clean_auth.py` - Example of secure code

## What the Demo Shows

- ✗ Hardcoded API keys
- ✗ SQL injection vulnerabilities
- ✗ LLM-generated stub functions
- ✗ Hardcoded secrets
- ✓ Security best practices

## Customizing

Edit `bolo-demo.sh` to:
- Add sleep delays between steps
- Change colors
- Add more examples
- Adjust output verbosity
