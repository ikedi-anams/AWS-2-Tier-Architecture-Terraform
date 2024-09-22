resource "aws_instance" "web1" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  key_name      = "Iksam-kp"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  subnet_id = aws_subnet.private_subnet1.id
  associate_public_ip_address = true

  tags = {
    Name = "web1_instance"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  key_name      = "Iksam-kp"
  availability_zone = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  subnet_id = aws_subnet.private_subnet2.id
  associate_public_ip_address = true

  tags = {
    Name = "web2_instance"
  }
}