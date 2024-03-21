#$password = openssl rand -base64 42


$image = "apache/superset:$($env:SUPERSET_VERSION)"
write-host $image $password

docker run -d -p 8080:8088 -e "SUPERSET_SECRET_KEY=$password" -e "TALISMAN_ENABLED=False" --name superset $image

