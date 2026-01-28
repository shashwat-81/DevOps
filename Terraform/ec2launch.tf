 resource "aws_instance" "test-instance" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"

  tags = {
    Name = "test-instance"
  }
}