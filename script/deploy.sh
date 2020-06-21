#!/usr/bin/env bash

set -o pipefail
RESOURCE=$1
ENVIRONMENT=${2:-preview}
SCRIPT_DIR="$(cd "$(dirname "$0")" ; pwd -P)"



function main() {
deploy_tf
}

function deploy_tf(){
pushd "../terraform/${RESOURCE}" > /dev/null

#unset AWS_VAULT
aws-vault exec pmulmi-admin
terraform workspace select "${ENVIRONMENT}" || terraform workspace new "${ENVIRONMENT}"
terraform init
terraform apply -var-file=preview.tfvars

popd > /dev/null

}

main