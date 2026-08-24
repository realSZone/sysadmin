## Mac
### Change Computer Name
```bash
printf "Enter computer name: "; read COMPUTER_NAME && sudo scutil --set ComputerName "$COMPUTER_NAME" && sudo scutil --set LocalHostName "$COMPUTER_NAME" && sudo scutil --set HostName "$COMPUTER_NAME" && echo "Computer name set to: $COMPUTER_NAME"
```
### Download & Install Applications
```bash
sudo zsh -c 'set -euo pipefail; TMPDIR=$(mktemp -d); trap "rm -rf \"$TMPDIR\"" EXIT; curl -fsSL -o "$TMPDIR/Installomator.sh" https://raw.githubusercontent.com/Installomator/Installomator/release/Installomator.sh; chmod +x "$TMPDIR/Installomator.sh"; for label in displaylinkmanager googlechromepkg slack googledrive 1password8; do "$TMPDIR/Installomator.sh" "$label" DEBUG=0; done; curl -fsSL -o /tmp/HubMacOS.pkg "https://packages.omnissa.com/wsone/HubMacOS.pkg"; installer -pkg /tmp/HubMacOS.pkg -target /; rm -f /tmp/HubMacOS.pkg; echo "Done."'
```
This executes in the following order:

1. Download Installomator.
2. Install:
   * DisplayLink Manager
   * Google Chrome
   * Slack
   * Google Drive
   * 1Password 8
3. Download Workspace ONE Intelligent Hub.
4. Install the `.pkg`.
5. Delete the downloaded package.
6. Print `Done`.

<!-- This is commented out ...
  #### Download & Install MDM Agent
  ```bash
  curl -fsSL -o /tmp/HubMacOS.pkg "https://packages.omnissa.com/wsone/HubMacOS.pkg" && sudo installer -pkg /tmp/HubMacOS.pkg -target / && rm -f /tmp/HubMacOS.pkg
  ```
  #### Download & Install Applications w/o MDM Agent
  ```bash
  sudo zsh -c 'set -euo pipefail; TMPDIR=$(mktemp -d); trap "rm -rf \"$TMPDIR\"" EXIT; curl -fsSL -o "$TMPDIR/Installomator.sh" https://raw.githubusercontent.com/Installomator/Installomator/release/Installomator.sh; chmod +x "$TMPDIR/Installomator.sh"; for label in displaylinkmanager googlechromepkg slack googledrive 1password8; do "$TMPDIR/Installomator.sh" "$label" DEBUG=0; done; echo "Done."'
  ```
  #### Install Applications (Manually Download File First)
  ```bash
  sudo zsh ~/Downloads/mac_install_apps.sh
  ```
... This is commented out -->

#### Install MS Office (optional)
👉 remove unwanted apps from script (after `for label in `)
```bash
sudo zsh -c 'set -euo pipefail; TMPDIR=$(mktemp -d); trap "rm -rf \"$TMPDIR\"" EXIT; curl -fsSL -o "$TMPDIR/Installomator.sh" https://raw.githubusercontent.com/Installomator/Installomator/release/Installomator.sh; chmod +x "$TMPDIR/Installomator.sh"; for label in microsoftword microsoftexcel microsoftpowerpoint microsoftoutlook microsoftonenote; do "$TMPDIR/Installomator.sh" "$label" DEBUG=0; done; echo "Done."'
```
### Clean Up Dock
```bash
bash -lc 'set -euo pipefail; add_item(){ /usr/bin/defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; }; add_item_if_exists(){ [[ -d "$1" ]] && add_item "$1"; }; /usr/bin/defaults write com.apple.dock persistent-apps -array; /usr/bin/defaults write com.apple.dock persistent-others -array; add_item "/System/Applications/Apps.app"; add_item "/System/Applications/System Settings.app"; add_item_if_exists "/Applications/Google Chrome.app"; add_item_if_exists "/Applications/Slack.app"; add_item_if_exists "/Applications/Workspace ONE Intelligent Hub.app"; add_item_if_exists "/Applications/Google Drive.app"; add_item_if_exists "/Applications/1Password.app"; /usr/bin/killall cfprefsd 2>/dev/null || true; /usr/bin/killall Dock'
```

## Windows
### Install Applications
Terminal (run as administrator):
```powershell
$packages=@("DisplayLink.GraphicsDriver","Google.Chrome","SlackTechnologies.Slack","Google.GoogleDrive","AgileBits.1Password","7zip.7zip","Omnissa.WorkspaceONEIntelligentHub"); foreach($package in $packages){ winget install --id $package --exact --source winget --accept-package-agreements --accept-source-agreements }
```
This installs the following applications using Windows Package Manager (winget):

* DisplayLink Graphics Driver
* Google Chrome
* Slack
* Google Drive
* 1Password
* 7-Zip
* Workspace ONE Intelligent Hub

#### if Workspace ONE Intelligent Hub fails, try
```powershell
winget install -e --id Omnissa.WorkspaceONEIntelligentHub
```
or install it manually!

#### Install Ubuntu Fonts
Terminal (run as administrator):
```powershell
$d="$env:TEMP\UbuntuFonts"; Remove-Item $d -Recurse -Force -ErrorAction SilentlyContinue; New-Item -ItemType Directory $d | Out-Null; @("Ubuntu-Light.ttf","Ubuntu-LightItalic.ttf","Ubuntu-Regular.ttf","Ubuntu-Italic.ttf","Ubuntu-Medium.ttf","Ubuntu-MediumItalic.ttf","Ubuntu-Bold.ttf","Ubuntu-BoldItalic.ttf") | ForEach-Object { Invoke-WebRequest -Uri "https://raw.githubusercontent.com/google/fonts/main/ufl/ubuntu/$_" -OutFile "$d\$_" }; $fonts=(New-Object -ComObject Shell.Application).Namespace(0x14); Get-ChildItem $d -Filter *.ttf | ForEach-Object { $fonts.CopyHere($_.FullName,0x10) }; Remove-Item $d -Recurse -Force
```

#### Install Google Docs, Sheets and Slides as Chrome PWAs
Terminal (run as administrator):
```powershell
$p="HKLM:\SOFTWARE\Policies\Google\Chrome"; New-Item $p -Force | Out-Null; New-ItemProperty $p -Name WebAppInstallForceList -PropertyType String -Value '[{"url":"https://docs.google.com/document/installwebapp?usp=admin","default_launch_container":"window"},{"url":"https://docs.google.com/spreadsheets/installwebapp?usp=admin","default_launch_container":"window"},{"url":"https://docs.google.com/presentation/installwebapp?usp=admin","default_launch_container":"window"}]' -Force | Out-Null
```

#### Install Dell Command | Update (optional)
Terminal (run as administrator):
```powershell
winget install --id Dell.CommandUpdate.Universal -e --source winget && & "$env:ProgramFiles\Dell\CommandUpdate\dcu-cli.exe" /applyUpdates -silent
```
This will:
* Install Dell Command | Update.
* Scan for Dell-specific updates.
* Install the latest BIOS, firmware, drivers, and Dell applications.
