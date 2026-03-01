# Example: Clean authentication code
import sqlite3
import os
import hashlib

def login_user(username, password):
    # ✓ API key from environment
    api_key = os.getenv('API_KEY')

    # ✓ Parameterized query (no SQL injection)
    conn = sqlite3.connect('users.db')
    query = "SELECT * FROM users WHERE username=? AND password=?"
    cursor = conn.execute(query, (username, password))

    return cursor.fetchone()

def validate_input(data):
    # ✓ Proper validation implementation
    if not data or len(data) < 3:
        raise ValueError("Invalid input data")
    return data.strip()

def process_payment(card_number):
    # ✓ Use environment variable for secrets
    secret_key = os.getenv('PAYMENT_SECRET')
    # ✓ Hash sensitive data before logging
    card_hash = hashlib.sha256(card_number.encode()).hexdigest()[:8]
    log_payment(card_hash, secret_key)

def log_payment(card_hash, key):
    print(f"Processing payment for card hash: {card_hash}")
