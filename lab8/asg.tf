resource "aws_autoscaling_group" "my_asg" {
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }

  min_size           = 1
  max_size           = 5
  desired_capacity   = 2
  vpc_zone_identifier = [aws_subnet.my_subnet.id] # Subnet ID của bạn

  target_group_arns = [aws_lb_target_group.my_tg.arn] # Gắn với Target Group nếu sử dụng Load Balancer

  tag {
    key                 = "Name"
    value               = "AutoScalingInstance"
    propagate_at_launch = true
  }
}
