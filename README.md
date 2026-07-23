## Mac
### Change computer name
```bash
printf "Enter computer name: "; read COMPUTER_NAME && sudo scutil --set ComputerName "$COMPUTER_NAME" && sudo scutil --set LocalHostName "$COMPUTER_NAME" && sudo scutil --set HostName "$COMPUTER_NAME" && echo "Computer name set to: $COMPUTER_NAME"
```
### Download & install MDM agent
```bash
curl -fsSL -o /tmp/HubMacOS.pkg "https://packages.omnissa.com/wsone/HubMacOS.pkg" && sudo installer -pkg /tmp/HubMacOS.pkg -target / && rm -f /tmp/HubMacOS.pkg
```
### Download & install applications
```bash
sudo zsh -c 'set -euo pipefail; APPS="displaylinkmanager googlechrome slack googledrive 1password8"; TMPDIR=$(mktemp -d); trap "rm -rf \"$TMPDIR\"" EXIT; curl -fsSL -o "$TMPDIR/Installomator.sh" https://raw.githubusercontent.com/Installomator/Installomator/release/Installomator.sh; chmod +x "$TMPDIR/Installomator.sh"; for app in $APPS; do "$TMPDIR/Installomator.sh" "$app" DEBUG=0; done; echo "Done."'
```
#### Alternative: install applications (download file first)
```bash
sudo zsh ~/Downloads/mac_install_apps.sh
```

## Windows
### Install applications
Terminal (run as administrator):
```powershell
PowerShell -ExecutionPolicy Bypass -File .\Downloads\win_install_apps.ps1
```
### Install Dell Command | Update
Terminal (run as administrator):
```powershell
PowerShell -ExecutionPolicy Bypass -File .\Downloads\win_install_dellcmdupdate.ps1
```
This will:
* Install Dell Command | Update.
* Scan for Dell-specific updates.
* Install the latest BIOS, firmware, drivers, and Dell applications.
