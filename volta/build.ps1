param(
  [Parameter()]
  [ValidateSet('', 'ohmyposh', 'pwsh')]
  $Features = $null 
)

function Build-VoltaDocker {
  param(
    [Parameter()]
    [ValidateSet('', 'ohmyposh', 'pwsh')]
    [string[]]$Features = @() 
  )
  $imageNameArgs = @("volta")
  $pwshvar = ""
  if ($Features -contains "pwsh") {
    $pwshvar = "pwsh"
    $imageNameArgs += "pwsh"
  }

  $ohmyposhvar = "''"
  if ($Features -contains "ohmyposh") {
    $ohmyposhvar = "ohmyposh"
    $imageNameArgs += "ohmyposh"
  }

  $imageName = $imageNameArgs -join "-"

  $builded = docker build --tag $imageName --build-arg PWSH=$pwshvar --build-arg OHMYPOSH=$ohmyposhvar "$PSScriptRoot/volta-container"

  $imageName
}

Build-VoltaDocker @PSBoundParameters