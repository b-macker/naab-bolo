# NAAb BOLO - Recording Demos for GitHub

This guide shows how to create visual demos for your README.

## Quick Demo

```bash
cd demos
./bolo-demo.sh
```

This runs an **automated demo** showing BOLO detecting security issues.

---

## Recording Options

### Option 1: Screenshot (Easiest) ⭐

**Best for:** Quick visual proof, no tools needed

1. Run the demo:
   ```bash
   ./bolo-demo.sh
   ```

2. When you see interesting output, take a screenshot:
   - **Termux**: Power + Volume Down
   - **Desktop**: Your OS screenshot tool

3. Crop and add to README:
   ```markdown
   ![BOLO Demo](demos/screenshot.png)
   ```

**Recommended screenshots:**
- The scan summary showing 4 violations detected
- The colorized violation output

---

### Option 2: Terminal Recording with asciinema

**Best for:** Embeddable terminal player

1. Install asciinema:
   ```bash
   pkg install asciinema
   ```

2. Record:
   ```bash
   asciinema rec bolo-demo.cast
   ./bolo-demo.sh
   # Press Ctrl+D when done
   ```

3. Upload:
   ```bash
   asciinema upload bolo-demo.cast
   ```

4. Add to README:
   ```markdown
   [![asciicast](https://asciinema.org/a/YOUR_ID.svg)](https://asciinema.org/a/YOUR_ID)
   ```

---

### Option 3: GIF (Most Visual)

**Best for:** Inline animated demos

**Using script:**
```bash
# Record with script
script -t 2>timing.txt -a output.txt
./bolo-demo.sh
exit

# Convert to GIF (requires additional tools)
```

**Or use online services:**
- https://terminalizer.com
- https://github.com/charm-sh/vhs

---

## What to Capture

### Key Moments:

1. **Violation Detection** (most important!)
   - Red ✗ marks
   - Issue descriptions
   - Line numbers

2. **Scan Summary**
   - Files scanned
   - Violations found
   - Color-coded results

3. **Before/After Comparison**
   - bad_auth.py with issues
   - clean_auth.py passing

---

## Adding to README

### Simple Screenshot
```markdown
## Demo

![BOLO Security Scan](demos/bolo-demo.png)

BOLO detected 4 security issues:
- Hardcoded API keys
- SQL injection vulnerability
- LLM stub function
- Hardcoded secrets
```

### With asciinema
```markdown
## Demo

[![BOLO Demo](https://asciinema.org/a/YOUR_ID.svg)](https://asciinema.org/a/YOUR_ID)
```

### Multiple Screenshots
```markdown
## Demo

| Scan Results | Violations Detected |
|--------------|---------------------|
| ![Scan](demos/scan.png) | ![Violations](demos/violations.png) |
```

---

## Tips for Best Results

- **Timing**: Let each step display for 2-3 seconds
- **Colors**: Terminal should have good contrast
- **Font**: Use a readable monospace font
- **Width**: Keep terminal width ~80 columns for best display
- **Clean**: Close other terminal tabs/windows

---

## Editing the Demo

The demo script is at `demos/bolo-demo.sh`. You can:

- Adjust `sleep` durations
- Change colors (see variables at top)
- Add more examples
- Customize output text

Example:
```bash
# Longer pause for screenshots
sleep 5  # instead of sleep 2
```

---

## Need Help?

- asciinema docs: https://asciinema.org/docs/usage
- Termux wiki: https://wiki.termux.com
- GitHub README guide: https://guides.github.com/features/mastering-markdown/
