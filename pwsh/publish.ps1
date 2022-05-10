param(
  [Parameter()]
  [ValidateSet('', 'ohmyposh')]
  $Features = @('ohmyposh')
)

$imageName = & "$PSScriptRoot/build.ps1" -Features $Features

docker login

docker image tag $imageName 4ndru/$imageName
docker image push 4ndru/$imageName