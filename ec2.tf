# create login key-pair using "ssh-keygen" command through terminal
# pass those keys as key-pair, which would later be used for ssh

resource aws_key_pair my_key {
    key_name = "ec2-terraform-key"
    public_key = file("ec2-terraform-key.pub")
}

# VPC & Security for ec2

resource aws_default_vpc default {}     # Using aws default vpc

resource aws_security_group my_sg {     # Creating security group
    name = "tf-sg"
    description = "security group added using terraform"
    vpc_id = aws_default_vpc.default.id

    # inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "ssh open"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open"
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "https open"
    }

    # outbound rules
    # egress {}  

    tags = {
        Name = "security-tag"
    }
}


# Creating ec2 instance

resource aws_instance ec2_instance {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_sg.name]
    instance_type = "m7i-flex.large"                          # Cpu
    ami = "ami-080254318c2d8932f"                             # Ubuntu AMI id

    root_block_device {                                       # storage of ec2
        volume_size = 20
        volume_type = "gp3"
    }

    tags = {
            Name = "ec2-tag"
    }
}