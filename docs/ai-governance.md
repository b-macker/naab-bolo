# AI Governance

NAAb BOLO includes 4 AI governance validators that check your ML/AI projects for compliance with responsible AI practices.

## Validators

### 1. Governance Config (`ai_governance_config`)

Checks for an `ai-config.yaml` file with required sections:

- `version` — Config version for compatibility
- `model_policies` — Per-model usage policies (allowed/prohibited uses)
- `guardrails` — Input validation, output filtering, rate limiting

### 2. Model Attestation (`model_attestation`)

Verifies that model files (`.onnx`, `.pt`, `.h5`, etc.) have corresponding attestation documents:

- `data_lineage` — Training data sources and provenance
- `preprocessing_steps` — Data transformations applied
- `model_version` — Version tracking (recommended)
- `training_date` — When the model was trained (recommended)
- `evaluation_metrics` — Performance benchmarks (recommended)

Supports JSON, YAML, and Markdown model cards.

### 3. Rate Limiting (`rate_limiting`)

Scans inference endpoint code for rate limiting protection:

- Detects `@app.post("/predict")` style endpoints
- Checks for `flask_limiter`, `slowapi`, `RateLimiter` imports
- Verifies config-level rate limit definitions

### 4. Explainability (`explainability`)

Checks that ML model training code includes explainability tooling:

- SHAP (TreeExplainer, GradientShap)
- LIME (LimeTabularExplainer)
- ELI5
- Captum (IntegratedGradients, DeepLift)
- Feature importance analysis

## Example ai-config.yaml

```yaml
version: "1.0"

model_policies:
  gpt-4:
    allowed_uses:
      - "text summarization"
      - "code review"
    prohibited_uses:
      - "autonomous decisions"

guardrails:
  input_validation:
    max_input_length: 10000
    content_filtering: true
  output_filtering:
    pii_detection: true
  rate_limiting:
    requests_per_minute: 60

explainability:
  required_for_production: true
  tools: ["shap", "lime"]
```

## Running AI Governance Check

```bash
./naab/build/naab-lang ai-check.naab /path/to/ml-project
```

Output includes compliance score (0-100%) and per-validator pass/fail status.
