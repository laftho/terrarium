tag=$1

echo -n "github username: "
read username

token=`gpg -d ~/secrets/github/releaser.gpg`

curl -u $username:$token https://api.github.com/user

release=$(curl -u $username:$token -d "{ \"tag_name\": \"${tag}\", \"target_commitish\": \"master\", \"name\": \"${tag}\", \"body\": \"Terrarium release\" }" -H "Content-Type: application/json" -X POST https://api.github.com/repos/laftho/terrarium/releases)
release_id=$(jq -r '.id' <<< "${release}")

echo "Relase ID: ${release_id}"

echo "Uploading dxfs"

curl -u $username:$token -d "@top.dxf" -H "Content-Type: image/vnd.dxf" -X POST https://uploads.github.com/repos/laftho/terrarium/releases/${release_id}/assets?name=top.dxf
curl -u $username:$token -d "@bottom.dxf" -H "Content-Type: image/vnd.dxf" -X POST https://uploads.github.com/repos/laftho/terrarium/releases/${release_id}/assets?name=bottom.dxf

echo "Uploading svgs"

curl -u $username:$token -d "@top.svg" -H "Content-Type: application/vnd.oipf.dae.svg+xml" -X POST https://uploads.github.com/repos/laftho/terrarium/releases/${release_id}/assets?name=top.svg
curl -u $username:$token -d "@bottom.svg" -H "Content-Type: application/vnd.oipf.dae.svg+xml" -X POST https://uploads.github.com/repos/laftho/terrarium/releases/${release_id}/assets?name=bottom.svg
