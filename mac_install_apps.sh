#!/bin/zsh
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run this script with sudo."
  exit 1
fi

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

curl -fsSL \
  -o "$TMPDIR/Installomator.sh" \
  https://raw.githubusercontent.com/Installomator/Installomator/release/Installomator.sh

chmod +x "$TMPDIR/Installomator.sh"

labels=(
  displaylinkmanager
  googlechrome
  slack
  googledrive
  1password8
)

for label in "${labels[@]}"; do
  "$TMPDIR/Installomator.sh" "$label" DEBUG=0
done

echo "Done."
