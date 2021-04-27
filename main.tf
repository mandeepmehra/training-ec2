provider "aws" {
region = "us-east-1"
}


variable "ami_id" {
  default = "ami-0742b4e673072066f"
  description = "AMI Id for the EC2 instance"
  type = string
}


variable "instance_count" {
  description = "No. of EC2 instances to create"
  default = 2
  type = number
}

variable "ec2_tags" {
  default = [ "Mandeep-Web", "Mandeep-App"]
  description = "Tags for EC2 instance"
}

resource "aws_instance" "myec2" {
  count = var.instance_count
  ami = var.ami_id
  instance_type = "t2.micro"

  tags = {
    "Name" = var.ec2_tags[count.index]
  }
}

output "myec2_instance_ip_0" {
  value = aws_instance.myec2[0].public_ip
}

output "myec2_instance_ip_1" {
  value = aws_instance.myec2[1].public_ip
}

output "myec2_private_ip"{
  value = aws_instance.myec2[*].private_ip
}