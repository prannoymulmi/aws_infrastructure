# https://github.com/deanwilson/tf_sns_email
# Terraform does not directly support sns email protocl so using this module
module "sns-billing-email-topic" {
  source = "github.com/deanwilson/tf_sns_email"

  display_name = "${var.display_name}"
  email_address = "${var.email_addresses}"
  owner = "pmulmi"
  stack_name = "${var.stack_name}"
  protocol = "${var.protocol}"
}