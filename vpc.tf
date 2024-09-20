resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr # ? get the cidr block from the variable vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "dev_vpc"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "dev_igw"
  }   
}

resource "aws_subnet" "public_subnet_az1"{
    vpc_id = aws_vpc.vpc.id
    cidr_block =  var.public_subnet_az1_cidr
    availability_zone = var.availability_zone_us_east_1a
    map_public_ip_on_launch = true

    tags = {
      Name = "dev_public_subnet_az1"
    }

}

resource "aws_subnet" "public_subnet_az2"{
    vpc_id = aws_vpc.vpc.id
    cidr_block =  var.public_subnet_az2_cidr
    availability_zone = var.availability_zone_us_east_1b
    map_public_ip_on_launch = true

    tags = {
      Name = "dev_public_subnet_az2"
    }

}    

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    
    tags = {
      Name = "dev_public_route_table"
    }
}


resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

  
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}



resource "aws_subnet" "private_subnet_az1"{
    vpc_id = aws_vpc.vpc.id
    cidr_block =  var.private_subnet_az1_cidr
    availability_zone = var.availability_zone_us_east_1a
    map_public_ip_on_launch = false

    tags = {
      Name = "dev_private_subnet_az1"
    }

}

resource "aws_subnet" "private_subnet_az2"{
    vpc_id = aws_vpc.vpc.id
    cidr_block =  var.private_subnet_az2_cidr
    availability_zone = var.availability_zone_us_east_1b
    map_public_ip_on_launch = false

    tags = {
      Name = "dev_private_subnet_az2"
    }

}