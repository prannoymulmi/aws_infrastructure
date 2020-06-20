#!/usr/bin/env bash

set -o pipefail
RESOURCE=$1
SCRIPT_DIR="$(cd "$(dirname "$0")" ; pwd -P)"



function main() {
deploy_tf
}

function deploy_tf(){
pushd "../terraform/${RESOURCE}" > /dev/null
pwd
aws-vault exec pmulmi-admin -- terraform init

popd > /dev/null

}

pushd "${SCRIPT_DIR}" > /dev/null
  main
popd > /dev/null