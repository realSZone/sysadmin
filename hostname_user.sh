#!/bin/bash
set -e

echo "=== Mac Setup ==="
echo

# Prompt for computer name
read -rp "Computer Name (e.g. N21234): " COMPUTER_NAME
echo

# Prompt for new admin user
read -rp "Full Name: " FULL_NAME
read -rp "Account Name: " ACCOUNT_NAME
read -rsp "Password: " PASSWORD
echo
echo

echo "Configuring computer name..."
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"

echo "Creating local administrator account..."

# Create user
sudo sysadminctl \
    -addUser "$ACCOUNT_NAME" \
    -fullName "$FULL_NAME" \
    -password "$PASSWORD" \
    -admin

echo
echo "✅ Setup complete!"
echo
echo "Computer Name : $COMPUTER_NAME"
echo "Admin User    : $ACCOUNT_NAME ($FULL_NAME)"
