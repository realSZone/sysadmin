#!/bin/bash
set -euo pipefail

add_item () {
  local app_path="$1"
  /usr/bin/defaults write com.apple.dock persistent-apps -array-add "
<dict>
  <key>tile-data</key>
  <dict>
    <key>file-data</key>
    <dict>
      <key>_CFURLString</key>
      <string>${app_path}</string>
      <key>_CFURLStringType</key>
      <integer>0</integer>
    </dict>
  </dict>
</dict>"
}

add_item_if_exists() {
    local app="$1"
    [[ -d "$app" ]] && add_item "$app"
}

# Clear everything currently pinned
/usr/bin/defaults write com.apple.dock persistent-apps -array
/usr/bin/defaults write com.apple.dock persistent-others -array

# Add back only the items you want
add_item "/System/Applications/Apps.app"
add_item "/System/Applications/System Settings.app"
add_item_if_exists "/Applications/Google Chrome.app"
add_item_if_exists "/Applications/Slack.app"
add_item_if_exists "/Applications/Workspace ONE Intelligent Hub.app"
add_item_if_exists "/Applications/Google Drive.app"

# Reload prefs and Dock
/usr/bin/killall cfprefsd 2>/dev/null || true
/usr/bin/killall Dock
