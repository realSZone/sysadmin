#!/bin/bash
set -euo pipefail

DOCK_PLIST="$HOME/Library/Preferences/com.apple.dock.plist"

plutil -replace persistent-apps -json '[
  {
    "tile-data": {
      "file-data": {
        "_CFURLString": "/System/Library/CoreServices/Finder.app",
        "_CFURLStringType": 0
      }
    }
  },
  {
    "tile-data": {
      "file-data": {
        "_CFURLString": "/System/Applications/Apps.app",
        "_CFURLStringType": 0
      }
    }
  },
  {
    "tile-data": {
      "file-data": {
        "_CFURLString": "/System/Applications/System Settings.app",
        "_CFURLStringType": 0
      }
    }
  }
]' "$DOCK_PLIST"

killall Dock
