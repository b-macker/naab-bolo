# Example: Bad authentication code with security issues
import sqlite3

def login_user(username, password):
    # ISSUE 1: Hardcoded API key
    api_key = "sk-1234567890abcdef"

    # ISSUE 2: SQL injection vulnerability
    conn = sqlite3.connect('users.db')
    query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}'"
    cursor = conn.execute(query)

    return cursor.fetchone()

def validate_input(data):
    # ISSUE 3: Stub function (LLM oversimplification)
    pass

def process_payment(card_number):
    # ISSUE 4: Storing credit card in plain text
    secret_key = "my_secret_key_123"
    log_payment(card_number, secret_key)

def log_payment(card, key):
    print(f"Processing payment for card: {card}")
