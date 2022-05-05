# docker build --tag voltabase:latest --build-arg PWSH="" --build-arg OHMYPOSH="" .
# docker image tag voltabase 4ndru/pansenklopper/voltabase
docker login
docker build --tag volta-pwsh-ohmyposh:latest --build-arg PWSH="pwsh" --build-arg OHMYPOSH="ohmyposh" "$PSScriptRoot/volta-container"

docker image tag volta-pwsh-ohmyposh 4ndru/volta-pwsh-ohmyposh
docker image push 4ndru/volta-pwsh-ohmyposh