tag=$1

echo -n "github username: "
read username

token=`gpg -d ~/secrets/github/releaser.gpg`

curl -u $username:$token https://api.github.com/user

RELASE_ID=`curl -u $username:$token -d '{ "tag_name": "${tag}", "target_commitish": "master", "name": "${tag}", "body": "Terrarium release" }' -H "Content-Type: application/json" -X POST https://api.github.com/repos/laftho/terrarium/releases | jq -r '.id'`

curl -u $username:$token -d "@top.dxf" -H "Content-Type: image/vnd.dxf" -X POST https://uploads.github.com/repos/laftho/terrarium/releases/${RELEASE_ID}/assets?name=top.dxf
curl -u $username:$token -d "@bottom.dxf" -H "Content-Type: image/vnd.dxf" -X POST https://uploads.github.com/repos/laftho/terrarium/releases/${RELEASE_ID}/assets?name=bottom.dxf

curl -u $username:$token -d "@top.svg" -H "Content-Type: application/vnd.oipf.dae.svg+xml" -X POST https://uploads.github.com/repos/laftho/terrarium/releases/${RELEASE_ID}/assets?name=top.svg
curl -u $username:$token -d "@bottom.svg" -H "Content-Type: application/vnd.oipf.dae.svg+xml" -X POST https://uploads.github.com/repos/laftho/terrarium/releases/${RELEASE_ID}/assets?name=bottom.svg
