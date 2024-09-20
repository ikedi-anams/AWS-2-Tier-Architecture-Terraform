resource "aws_eip" "nat_gateway_eip" {
    domain = "vpc"

    tags = {
      Name = "dev_nat_gateway_eip"
    }
  
}


resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "nat_gateway_az1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  #depends_on = [aws_internet_gateway.igw]
}


resource "aws_route_table" "private_route_table_az1" {
    vpc_id = aws_vpc.vpc.id

    
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
    }

    tags = {
      Name = "dev_private_route_table_az1"
    }
  
}


resource "aws_route_table_association" "private_subnet_az1_route_table_association" {
  subnet_id = aws_subnet.private_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

  
resource "aws_route_table_association" "private_route_table_association_az2" {
  subnet_id = aws_subnet.private_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az1.id
}