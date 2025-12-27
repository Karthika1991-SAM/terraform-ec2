terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider for Region 1 (US East - N. Virginia)
provider "aws" {
  region = "us-east-1"
  alias  = "useast"
}

# Provider for Region 2 (Mumbai)
provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

# EC2 in us-east-1
resource "aws_instance" "us_ec2" {
  provider      = aws.useast
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-US-East"
  }
}

# EC2 in ap-south-1
resource "aws_instance" "india_ec2" {
  provider      = aws.mumbai
  ami           = "ami-03f4878755434977f" # Amazon Linux 2 (ap-south-1)
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-Mumbai"
  }
}
