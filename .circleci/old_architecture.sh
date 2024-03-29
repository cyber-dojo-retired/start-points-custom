#!/bin/bash
set -ev

readonly SCRIPT=cyber-dojo
readonly ORG=https://raw.githubusercontent.com/cyber-dojo
readonly URL=${ORG}/commander/master/${SCRIPT}

curl -O ${URL}
chmod +x ./${SCRIPT}

sudo mkdir /cyber-dojo
sudo chown -R 19663:65533 /cyber-dojo

readonly MY_URL=https://github.com/cyber-dojo/start-points-custom.git
./${SCRIPT} start-point create custom --git=${MY_URL}
./${SCRIPT} start-point ls
./${SCRIPT} start-point ls | grep custom

npm install travis-ci
readonly TRIGGER=trigger-build.js
curl -O ${ORG}/cyber-dojo/master/shared/${TRIGGER}
node ${TRIGGER} cyber-dojo/web
