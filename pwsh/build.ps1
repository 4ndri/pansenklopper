param(
  [Parameter()]
  [ValidateSet('', 'ohmyposh')]
  $Features = $null 
)

function Build-VoltaDocker {
  param(
    [Parameter()]
    [ValidateSet('', 'ohmyposh')]
    [string[]]$Features = @() 
  )
  $imageNameArgs = @("pwsh")

  $ohmyposhvar = ""
  if ($Features -contains "ohmyposh") {
    $ohmyposhvar = "ohmyposh"
    $imageNameArgs += "ohmyposh"
  }

  $imageName = $imageNameArgs -join "-"

  $builded = docker build --tag $imageName --build-arg PWSH=$pwshvar --build-arg OHMYPOSH=$ohmyposhvar "$PSScriptRoot/container"

  $imageName
}

Build-VoltaDocker @PSBoundParameters