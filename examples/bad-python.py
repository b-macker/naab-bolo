# Example: Python file with intentional security and quality issues
# Used for testing NAAb BOLO detection capabilities

import os
import subprocess

# SECRET: Hardcoded API key (should be caught by secrets scanner)
API_KEY = "sk-proj-abc123def456ghi789jkl012mno345pqr678"
AWS_ACCESS_KEY = "AKIAIOSFODNN7EXAMPLE"
DATABASE_PASSWORD = "password123"

# PII: Email patterns in code
ADMIN_EMAIL = "admin@company.com"

# SQL INJECTION: String formatting in queries
def get_user(user_id):
    query = "SELECT * FROM users WHERE id = '%s'" % user_id
    return execute_query(query)

# SHELL INJECTION: Unsanitized input in subprocess
def process_file(filename):
    os.system("cat " + filename)
    subprocess.call("grep -r " + filename + " /var/log", shell=True)

# OVERSIMPLIFICATION: Stub functions (LLM anti-drift)
def validate_input(data):
    pass

def authenticate_user(username, password):
    return True

def check_permissions(user, resource):
    ...

# PLACEHOLDER: TODO markers
def encrypt_data(data):
    # TODO: implement actual encryption
    return data

# MOCK DATA: Hardcoded test values in production code
def get_config():
    return {
        "host": "localhost",
        "port": 8080,
        "debug": True  # Debug mode in production
    }

# APOLOGETIC LANGUAGE: LLM-generated patterns
# I apologize for the complexity of this function
# As an AI, I cannot guarantee this is correct
def complex_calculation(x, y):
    return x + y
