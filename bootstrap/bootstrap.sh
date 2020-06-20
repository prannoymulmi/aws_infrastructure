#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" ; pwd -P)"

AWS_REGION="eu-west-1"
NAME="hxmcdpcqyy"

function bootstrap() {

  aws cloudformation validate-template \
    --template-body "file://${SCRIPT_DIR}/bootstrap.yaml" \
    --region "${AWS_REGION}"
  aws cloudformation deploy \
    --template-file "${SCRIPT_DIR}/bootstrap.yaml" \
    --stack-name initial \
    --parameter-overrides \
        NAME=${NAME} \
    --capabilities CAPABILITY_NAMED_IAM \
    --region "${AWS_REGION}"
}

function main() {
#        aws cloudformation describe-stack-events  --region "${AWS_REGION}" --stack-name initial
        bootstrap
}

pushd "${SCRIPT_DIR}" > /dev/null
  main
popd > /dev/null


