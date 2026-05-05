output "ec2_public_ip" {
    value = aws_instance.ec2_instance.public_ip
    # value = aws_instance.ec2_instance[*].public_ip            # Use this instead, when (count) argument is used in aws_instance resource
}

output "ec2_public_dns" {
    value = aws_instance.ec2_instance.public_dns
    # value = aws_instance.ec2_instance[*].public_dns            # Use this instead, when (count) argument is used in aws_instance resource
}

output "ec2_private_ip" {
    value = aws_instance.ec2_instance.private_ip
    # value = aws_instance.ec2_instance[*].private_ip            # Use this instead, when (count) argument is used in aws_instance resource
}
