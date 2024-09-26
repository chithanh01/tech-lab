resource "aws_launch_template" "my_launch_template" {
  name = "my-launch-template"

  image_id      = "<AMI_ID>" # Thay bằng AMI ID của bạn
  instance_type = "t2.micro"

  key_name = "my-key-pair"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.my_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "AutoScalingInstance"
    }
  }
}