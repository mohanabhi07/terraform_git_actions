output "ec2_id" {
    description = "instance id's"
    value = aws_instance.web[*].id
}