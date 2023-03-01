resource "aws_security_group" "apche-amibackup" {
  name        = "ami-backup"
  description = "this is using for securitygroup"
  vpc_id      = var.vpc

  ingress {
    description = "this is inbound rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # security_groups = ["${aws_security_group.pavan-bastion.id}"]
    cidr_blocks = ["103.110.170.85/32"]
  }
  ingress {
    description = "this is inbound rule"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # security_groups = ["${aws_security_group.siva-alb-sg.id}"]
    cidr_blocks = ["0.0.0.0/0"]
  }




  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "siva"
  }
}

resource "aws_instance" "ami-apache" {

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_pair
  subnet_id     = var.subnet_id
  availability_zone = var.az

  security_groups = [aws_security_group.apche-amibackup.id]
  user_data       = file("httpd.sh")
  tags = {
    Name = "apache"
  }
}