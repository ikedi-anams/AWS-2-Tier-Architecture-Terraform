variable "vpc_cidr" {
    description = "The cidr block for the VPC"
    type = string
  
}


variable "public_subnet_az1_cidr" {
    description = "Public subnet az1 CIDR block"
    type = string
  
}


variable "public_subnet_az2_cidr" {
    description = "Public subnet az2 CIDR block"
    type = string
  
}


variable "private_subnet_az1_cidr" {
    description = "Private subnet az1 CIDR block"
    type = string
  
}

variable "private_subnet_az2_cidr" {
    description = "Private subnet az2 CIDR block"
    type = string
  
}


variable "availability_zone_us_east_1a" {
    description = "Availability zone for us-east-1a"
    type = string
  
}

variable "availability_zone_us_east_1b" {
    description = "Availability zone for us-east-1a"
    type = string
  
}
