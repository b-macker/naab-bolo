# Test fixture: Clean code with 0 violations
import os
import logging

logger = logging.getLogger(__name__)

def process_data(items):
    """Process a list of items safely."""
    results = []
    for item in items:
        if item and len(str(item)) > 0:
            results.append(str(item).strip())
    return results

def read_config(path):
    """Read config from validated path."""
    safe_path = os.path.abspath(path)
    if not safe_path.startswith("/etc/app"):
        raise ValueError("Invalid config path")
    with open(safe_path) as f:
        return f.read()
