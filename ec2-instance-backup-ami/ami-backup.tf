# resource "aws_ami_from_instance" "ami-bakupo" {
#   name               = "ami-instance-backup"
#   source_instance_id = ""
# }



resource "aws_ami_from_instance" "apache-ami-backup" {
  name               = "httpd-ami-backup"
  source_instance_id = var.source_instance_id
}