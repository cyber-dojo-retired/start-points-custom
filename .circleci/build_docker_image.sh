#!/bin/bash
set -ev

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
"${MY_DIR}/new_architecture.sh"
