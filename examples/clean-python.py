# Example: Clean Python file with zero violations
# Used to verify BOLO produces no false positives

import os
import hashlib
import logging
from typing import List, Optional

logger = logging.getLogger(__name__)


def hash_password(password: str, salt: bytes) -> str:
    """Hash a password with the given salt using SHA-256."""
    combined = salt + password.encode('utf-8')
    return hashlib.sha256(combined).hexdigest()


def validate_input(data: dict) -> Optional[str]:
    """Validate input data and return error message if invalid."""
    if not isinstance(data, dict):
        return "Input must be a dictionary"
    if "name" not in data:
        return "Missing required field: name"
    if len(data["name"]) > 255:
        return "Name exceeds maximum length of 255"
    return None


def read_config(path: str) -> dict:
    """Read configuration from a file path."""
    config_path = os.path.abspath(path)
    if not config_path.startswith(os.path.abspath("/etc/myapp")):
        raise ValueError("Config path must be under /etc/myapp")
    with open(config_path, 'r') as f:
        import json
        return json.load(f)


def process_items(items: List[str]) -> List[str]:
    """Process a list of items, filtering and transforming."""
    results = []
    for item in items:
        cleaned = item.strip()
        if cleaned and len(cleaned) > 0:
            results.append(cleaned.lower())
    return results
