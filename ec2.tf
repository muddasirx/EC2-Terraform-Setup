# create login key-pair using "ssh-keygen" command through terminal
# pass those keys as key-pair, which would later be used for ssh

resource aws_key_pair my_key {
    key_name = "tf-ec2-key"
    public_key = file("tf-ec2-key.pub")
}

# VPC & Security for ec2

resource aws_default_vpc default {}     # Using aws default vpc

resource aws_security_group new_sg {     # Creating security group
    name = "tf-new-sg"
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
    security_groups = [aws_security_group.new_sg.name]
    instance_type = var.ec2_instance_type                          # Cpu
    ami = var.ec2_ami                                              # Ubuntu AMI id
    user_data = file("install_docker.sh")                          # Run any shell script after creating the instance  

    root_block_device {                                       # storage of ec2
        volume_size = var.ec2_storage
        volume_type = "gp3"
    }

    tags = {
        Name = var.instance_name               # instance name
    }
}