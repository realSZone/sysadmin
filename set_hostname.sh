#!/bin/bash
set -e

# Prompt for computer name
read -rp "Computer Name (e.g. N21234): " COMPUTER_NAME
echo

echo "Configuring computer name..."
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"

echo
echo "✅ Computer name changed!"
