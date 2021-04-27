# resource "aws_vpc" "appvpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     "Name" = "appvpc-mandeep"
#   }
# }

data "aws_vpc" "anishvpc" {
  id = "vpc-0fc666121270d4dfb"
}

data "aws_availability_zones" "allazs" {
  
}

output "allazs" {
  value = data.aws_availability_zones.allazs
}

resource "aws_subnet" "appvpc_subnet" {
  count = length(data.aws_availability_zones.allazs.names)
  vpc_id = data.aws_vpc.anishvpc.id
  cidr_block = "10.0.${11+count.index}.0/28"
  availability_zone = data.aws_availability_zones.allazs.names[count.index]
  tags = {
    "Name" = "appvpc-mandeep-private-10.0.${11 +count.index}.0/28"
  }
}