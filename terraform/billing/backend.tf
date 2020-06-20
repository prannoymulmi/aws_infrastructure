terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-633035071730-eu-west-1"
    region = "eu-west-1"
    key = "aws_billing.json"
    dynamodb_table = "terraform-lock-table"
    encrypt = true
  }
  required_version = ">=0.12.25"
}
