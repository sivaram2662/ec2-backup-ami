resource "aws_eip" "demo1-eip" {
  instance = aws_instance.ami-apache.id
  vpc      = true
}