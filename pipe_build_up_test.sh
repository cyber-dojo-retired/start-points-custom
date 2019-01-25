#!/bin/bash
set -e

readonly ROOT_DIR="$( cd "$( dirname "${0}" )" && pwd )"
"${ROOT_DIR}/_ci_scripts/new_architecture.sh"
