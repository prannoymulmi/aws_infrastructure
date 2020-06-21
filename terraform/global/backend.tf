terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-hxmcdpcqyy-eu-west-1"
    region = "eu-west-1"
    key = "aws_global.json"
    dynamodb_table = "terraform-lock-table"
    encrypt = true
  }
  required_version = ">=0.12.25"
}
