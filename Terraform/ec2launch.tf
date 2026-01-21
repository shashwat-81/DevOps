resource "aws_instance" "Instance Name" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "Instance Tag"
  }
}