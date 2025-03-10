#VPC
output "vpc_id" {
  value = aws_vpc.main.id
}

locals {
  #To format the subnet IDs which may be mltipels format in subnet_name = {id= , az=}
  public_subnet_output = {
    for key, config in local.public_subnet: key  =>{
        subnet_id = aws_subnet.aws_vpc.main[key].id
        az = aws_subnet.aws_vpc.main[key].availability_zone
     }
    }
    private_subnet_output = {
      for key, config in local.private_subnet: key  =>{
        subnet_id = aws_subnet.aws_vpc.main[key].id
        az = aws_subnet.aws_vpc.main[key].availability_zone
    }
}
}

#Subnet-details
output "public_subnet" {
    value = local.public_subnet_output 
  
}

output "private_subnet" {
    value = local.private_subnet_output
  
}