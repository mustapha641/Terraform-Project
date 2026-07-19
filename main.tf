terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "welcome" {
  filename = "${path.module}/hello.txt"
  content  = "Your VS Code Terraform setup works perfectly!"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-Web-Server"
  }
}