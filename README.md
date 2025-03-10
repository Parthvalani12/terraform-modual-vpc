This terraform modual create aws vpc with a given CIDR block. it also create multiple subnets (public and private ), and for public subnetes,it sets up an internet Gateway (igw) and approch route table


module "vpc" {
source = "./modual/vpc"
vpc_config = {
cidr_block = "10.0.0.0/16"
name = "my-test-vpc"
}
subnet_config = {
#key={cidr, az}
public_subnet = {
cidr_block = "10.0.0.0/24"
az = "us-east-1a"
public = true
}

    public_subnet-2 = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1a"
      public = true
    }

    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
    }

}
}
