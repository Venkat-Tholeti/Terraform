output "ec2_instance_info" {
  value = aws_instance.roboshop  # this will store the info of created resource and can be used in creating another resources like EC2 Info used to create Route 53
}