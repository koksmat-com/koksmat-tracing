<#---
title: Get sessions log from pod
tag: get-session-logs
---#>
param (
    $podname = "meeting-infrastructure-app-566dbff678-7nwh7"
)


if ($env:WORKDIR -eq $null) {
    $env:WORKDIR = join-path $psscriptroot ".." ".koksmat" "workdir"
}
$workdir = $env:WORKDIR

if (-not (Test-Path $workdir)) {
    $x = New-Item -Path $workdir -ItemType Directory 
}

$workdir = Resolve-Path $workdir
#$vars = 
kubectl exec "pod/$podname"  -- tar -czvf /root/kitchen.tar.gz /kitchens
$colon = ":"
write-host kubectl cp $podname$colon/root/kitchen.tar.gz  $workdir/kitchen.tar.gz 
kubectl cp $podname$colon/root/kitchen.tar.gz  $workdir/kitchen.tar.gz 
$tarfile = "$env:WORKDIR/kitchen.tar.gz"

tar -xvzf $tarfile -C $workdir 
   
