#important only 2 budgets should be made, otherwise
resource "aws_budgets_budget" "cloudwatch" {
  name              = "budget-cloudwatch-monthly"
  budget_type       = "COST"
  limit_amount      = "2"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "MONTHLY"

  cost_filters = {
    Service = "AmazonCloudWatch"
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 100
    threshold_type      = "PERCENTAGE"
    notification_type   = "FORECASTED"

    subscriber_sns_topic_arns = [
      "${module.sns-billing-email-topic.arn}",
    ]
  }
}