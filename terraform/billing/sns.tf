module "sns-billing-email-topic" {
  source = "github.com/deanwilson/tf_sns_email"

  display_name  = "Example.org Admin Notifications"
  email_address = "admin@example.org"
  owner         = "Example.org:Admin"
  stack_name    = "admin-sns-email"
}