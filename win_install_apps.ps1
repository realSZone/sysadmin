$packages = @(
    "DisplayLink.GraphicsDriver"
    "Google.Chrome"
    "SlackTechnologies.Slack"
    "Google.GoogleDrive"
    "AgileBits.1Password"
    "7zip.7zip"
)

foreach ($package in $packages) {
    winget install `
        --id $package `
        --exact `
        --source winget `
        --accept-package-agreements `
        --accept-source-agreements
}
