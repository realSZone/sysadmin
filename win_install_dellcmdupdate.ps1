winget install --id Dell.CommandUpdate.Universal -e --source winget

& "$env:ProgramFiles\Dell\CommandUpdate\dcu-cli.exe" /applyUpdates -silent
