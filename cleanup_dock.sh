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

# Clear everything currently pinned
/usr/bin/defaults write com.apple.dock persistent-apps -array
/usr/bin/defaults write com.apple.dock persistent-others -array

# Add back only the items you want
add_item "/System/Library/CoreServices/Finder.app"
add_item "/System/Applications/Apps.app"
add_item "/System/Applications/System Settings.app"

# Reload prefs and Dock
/usr/bin/killall cfprefsd 2>/dev/null || true
/usr/bin/killall Dock
