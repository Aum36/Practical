provider "aws" {
    profile = "default"
    region = "ap-south-1"
}

data "aws_security_group" "selected" {
  id ="sg-04d9b435d25373bd4"
}


resource "aws_instance" "web" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorldTerraform"
  }
  
  user_data = file("intall.sh")
}

