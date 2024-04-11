terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    profile = "default"
    region = "ap-south-1"
}

resource "aws_instance" "web" {
    ami           = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    security_groups = ["launch-wizard-1"]
    user_data     = "${file("./install.sh")}"

    root_block_device {
        volume_size = 4  // 4GB volume size
        volume_type = "gp2"  // General Purpose SSD (gp2) volume type
    }
    tags = {
    Name = "Practical Exam Server"
  }
}

