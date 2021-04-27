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