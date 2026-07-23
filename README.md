## Mac
### Change computer name
```
printf "Enter computer name: "; read COMPUTER_NAME && sudo scutil --set ComputerName "$COMPUTER_NAME" && sudo scutil --set LocalHostName "$COMPUTER_NAME" && sudo scutil --set HostName "$COMPUTER_NAME" && echo "Computer name set to: $COMPUTER_NAME"
```
### Download & install MDM agent
```
curl -fsSL -o /tmp/HubMacOS.pkg "https://packages.omnissa.com/wsone/HubMacOS.pkg" && sudo installer -pkg /tmp/HubMacOS.pkg -target / && rm -f /tmp/HubMacOS.pkg
```
### Download & install applications
```
sudo zsh -c 'TMP=$(mktemp); curl -fsSL -o "$TMP" https://raw.githubusercontent.com/Installomator/Installomator/release/Installomator.sh && chmod +x "$TMP" && for app in displaylinkmanager googlechrome slack googledrive 1password8; do "$TMP" "$app" DEBUG=0; done; rm -f "$TMP"'
```
### Install applications (download file first)
```
sudo zsh ~/Downloads/mac_install_apps.sh
```

## Windows
### Install applications
Terminal (run as administrator):
```
PowerShell -ExecutionPolicy Bypass -File .\Downloads\win_install_apps.ps1
```
### Install Dell Command | Update
Terminal (run as administrator):
```
PowerShell -ExecutionPolicy Bypass -File .\Downloads\win_install_dellcmdupdate.ps1
```
This will:
* Install Dell Command | Update.
* Scan for Dell-specific updates.
* Install the latest BIOS, firmware, drivers, and Dell applications.
