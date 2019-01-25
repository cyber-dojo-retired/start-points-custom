#!/bin/bash
set -ev

readonly MY_TYPE=custom
readonly SCRIPT=build_cyber_dojo_start_points_image.sh
readonly URL=https://raw.githubusercontent.com/cyber-dojo/start-points-base/master/${SCRIPT}
readonly MY_IMAGE_NAME=cyberdojo/start-points-${MY_TYPE}-test
readonly TMP_DIR=$(mktemp -d /tmp/cyber-dojo-start-points-${MY_TYPE}.XXXXXXXXX)

cleanup() { rm -rf ${TMP_DIR} > /dev/null; }
trap cleanup EXIT

cd ${TMP_DIR}
curl -O ${URL}
chmod +x ./${SCRIPT}

./${SCRIPT} \
    ${MY_IMAGE_NAME} \
    --${MY_TYPE} \
      https://github.com/cyber-dojo/start-points-${MY_TYPE}.git \
    --exercises \
      https://github.com/cyber-dojo/start-points-exercises.git  \
    --languages \
      https://github.com/cyber-dojo/start-points-languages.git  \
