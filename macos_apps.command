if
    [[ `arch` == arm64 ]]; then
    echo "Architecture is Apple ARM"
    curl https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg --output ./Downloads/googlechrome.dmg
    curl -L https://slack.com/ssb/download-osx-silicon --output ./Downloads/slack.dmg
else
    echo "Architecture is Intel X86"
    curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg --output ./Downloads/googlechrome.dmg
    curl -L https://slack.com/ssb/download-osx --output ./Downloads/slack.dmg
fi
curl https://dl.google.com/drive-file-stream/GoogleDrive.dmg --output ./Downloads/GoogleDrive.dmg
curl https://downloads.1password.com/mac/1Password.zip --output ./Downloads/1Password.zip
curl https://desktop-downloads.asana.com/darwin_universal/prod/latest/Asana.dmg --output ./Downloads/Asana.dmg
open https://openvpn.net/downloads/openvpn-connect-v3-macos.dmg
