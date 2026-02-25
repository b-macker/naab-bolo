# Governance Profiles

NAAb BOLO ships with 5 built-in profiles. Each enables a specific set of checks.

## enterprise

**Everything enabled.** All 50+ checks across LLM anti-drift, security, code quality, and AI governance.

Use for: Production codebases, regulated environments, compliance audits.

## llm

**LLM anti-drift focus.** Detects code patterns commonly introduced by AI code generation:

- Oversimplification (stub functions, trivial returns)
- Incomplete logic (pass/... bodies, missing error handling)
- Hallucinated APIs (function calls that don't exist)
- Placeholders (TODO, FIXME, HACK markers)
- Mock data (hardcoded localhost, debug flags)
- Apologetic language ("I apologize", "As an AI")

Use for: AI-assisted development workflows, code review of LLM-generated PRs.

## security

**Security scanning.** Focused on vulnerabilities:

- Secrets (API keys, AWS credentials, passwords in source)
- PII (email patterns, SSN-like data)
- SQL injection (string formatting in queries)
- Shell injection (unsanitized subprocess calls)
- Privilege escalation (chmod 777, unnecessary sudo)
- Path traversal (unsanitized file paths)
- Data exfiltration (suspicious outbound requests)
- Information disclosure (stack traces in responses)
- Crypto misuse (weak algorithms, hardcoded keys)

Use for: Security audits, pre-deployment checks, SOC2 compliance.

## ai-governance

**AI/ML governance.** Validates AI deployment compliance:

- Governance config (ai-config.yaml with model policies and guardrails)
- Model attestation (data lineage, preprocessing documentation)
- Rate limiting (inference endpoint protection)
- Explainability (SHAP, LIME, feature importance artifacts)

Use for: ML model deployment pipelines, AI compliance frameworks.

## standard

**Balanced defaults.** Core checks without overwhelming noise:

- Secrets detection
- Core LLM anti-drift (oversimplification, hallucinated APIs)
- Shell injection prevention
- Placeholder detection

Use for: General development, getting started with governance.

## Custom Profiles

Create a JSON file in `profiles/` following the same structure as built-in profiles, then reference it with `--profile your-profile-name`.
