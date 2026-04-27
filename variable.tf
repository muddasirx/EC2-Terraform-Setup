variable "aws_region" {
    type = string
    default = "eu-north-1"	
}
variable "ec2_instance_type" {
    type = string
    default = "m7i-flex.large"	
}
variable "ec2_ami" {
    type = string
    default = "ami-080254318c2d8932f"
}
variable "ec2_storage" {
    type = number
    default = 20	
}
variable "instance_name" {
    type = string
    default = "tf-instance"	
}