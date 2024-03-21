<#---
title: Jaeger
tag: jaeger
---
#>


if ((Split-Path -Leaf (Split-Path  -Parent -Path $PSScriptRoot)) -eq "sessions"){
    $path = join-path $PSScriptRoot ".." ".."
}
else{
  $path = join-path $PSScriptRoot ".." ".koksmat/"

}

$koksmatDir = Resolve-Path $path

$dockerCompose = join-path $koksmatDir "jaeger" "dockercompose.yaml"

docker-compose -f $dockerCompose down
