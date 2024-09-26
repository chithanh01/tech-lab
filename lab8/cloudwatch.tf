resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name                = "cpu_high"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 60
  statistic                 = "Average"
  threshold                 = 70
  alarm_actions             = [aws_autoscaling_policy.scale_up.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.my_asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name                = "cpu_low"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 60
  statistic                 = "Average"
  threshold                 = 30
  alarm_actions             = [aws_autoscaling_policy.scale_down.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.my_asg.name
  }
}
