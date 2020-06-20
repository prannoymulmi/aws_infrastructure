# Check for more infor here <a href=https://mofoseng.github.io/posts/bootstrapping-aws/#aws-billing-alerts-and-budgets />

resource "aws_cloudwatch_metric_alarm" "account-billing-alarm" {
  alarm_name          = "account-billing-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1" # every 6 hours
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600" # The period in seconds ~ 6 hours
  statistic           = "Average"
  threshold           = "5"
  alarm_description   = "Billing alarm by account"
  alarm_actions       = ["<your-sns-topic-arn-for-notification>"]

  dimensions {
    Currency      = "USD"
    LinkedAccount = "${data.aws_caller_identity.account_id}"
  }
}