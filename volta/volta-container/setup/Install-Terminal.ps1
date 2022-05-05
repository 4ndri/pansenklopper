# if (Test-Path -Path "/opt/microsoft/powershell/7/Modules/PSReadLine") {
#   Remove-Item -Path "/opt/microsoft/powershell/7/Modules/PSReadLine" -Recurse -Force
# }

Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Repository PSGallery -Force -Confirm:$false
Install-Module -Name Terminal-Icons -Repository PSGallery -Confirm:$false -Force

$psProfileDir = Split-Path -Path $PROFILE -Parent

# powershell
if (-not (Test-Path -Path $psProfileDir)) {
  New-Item -Path $psProfileDir -ItemType Directory -Force
}

Copy-Item -Path "$PSScriptRoot/ps-profile/*" -Destination $psProfileDir -Force -Confirm:$false


# bash
# $ohmyposhEval = 'eval "$(oh-my-posh init bash)"'
# $ohmyposhEval = "`n$ohmyposhEval`n"

# $bashProfiles = @(
#   "~/.bashrc",
#   "~/.profile",
#   "~/.bash_profile"
# )
# foreach ($p in $bashProfiles) {
#   if (Test-Path -Path $p) {
#     Add-Content -Path $p -Value $ohmyposhEval -Force
#   }
# }
