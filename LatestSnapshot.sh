#!/bin/bash

command -v jq >/dev/null 2>&1 || sudo apt-get install jq -y

version=`curl -s 'https://launchermeta.mojang.com/mc/game/version_manifest.json' | jq '.versions[0]["url"]' | cut -d'"' -f2`

latest=`curl -s $version | jq '.downloads.server.url' | cut -d'"' -f2`

wget $latest -O 'snapshot.jar'