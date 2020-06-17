#!/usr/bin/env bash

set -o pipefail
ACCOUNT_NAME="preview"



function main() {
 dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
 setup_vault
}

function setup_vault(){
aws configure set region eu-west-1 --profile pmulmi-admin
    echo -n "Enter Access Key ID: "
    read -r aws_access_key_id
    echo ""
    echo -n "Enter Secret Access Key: "
    read -r aws_secret_access_key
    echo ""
    echo -n "Enter Role Name: "
    read -r aws_role_name
    echo ""
    echo -n "Enter Account Id: "
    read -r aws_account_id
    echo ""
    AWS_ACCESS_KEY_ID="${aws_access_key_id}" \
    AWS_SECRET_ACCESS_KEY="${aws_secret_access_key}" \
    aws-vault add pmulmi-admin --env

    aws configure set region eu-central-1 --profile pmulmi-admin
    aws configure set source_profile pmulmi-admin --profile pmulmi-admin
    aws configure set role_arn "arn:aws:iam::${aws_account_id}:role/${aws_role_name}" --profile pmulmi-admin
}

main