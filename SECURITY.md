# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | Yes                |

## Reporting a Vulnerability

If you discover a security vulnerability in NAAb BOLO, please report it responsibly:

1. **Do not** open a public issue
2. Email security concerns to the repository maintainer
3. Include steps to reproduce the vulnerability
4. Allow reasonable time for a fix before public disclosure

## Scope

NAAb BOLO is a static analysis tool. It reads source code files and generates reports. It does not:
- Execute scanned code
- Modify scanned files
- Make network requests during scanning
- Store or transmit scanned code

Polyglot blocks (Python, Shell) run in the NAAb runtime sandbox with standard process isolation.
