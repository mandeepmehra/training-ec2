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

