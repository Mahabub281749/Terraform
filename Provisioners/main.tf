terraform {
  cloud {
    organization = "Parvez"

    workspaces {
      name = "Provisioners"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.27.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "main" {
  id = "vpc-0920af1b9cf6869df"
}

resource "aws_security_group" "sg_my_server" {
  name        = "sg_my_server"
  description = "My server security group"
  vpc_id      = data.aws_vpc.main.id

  ingress = [
      {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids =[]
      security_groups = []
      self = false
    },

    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["62.183.135.154/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]
  egress = [ {
    description = "ougoing traffics"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    security_groups = []
    self = false
  }]
}

data "template_file" "user_data"{
  template = file("./userdata.yaml")
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJJDLwk3qZunhD/pwbPSomLinnTz/v7uvNep9OZIk+M5Zsbukii0AQDCQ1YFddmwzs5Pb/pvxgDe/RFCz++UolL6r3n+Yav5aY7QcTQCbyEJUVFoTgz9h245WJ2AlhJTYCWvcI1oJ0DL6IixiS2o6s7g8L6KHP29fDuFhMntzZ+1ujQYChqLgtdaFOGBYCdXsvuw1g3cum6tDG+2ewpl+0s8vq/Da2JlFr5ZILlgsPSStrQLKQBngaRW0aFuVhPykYtcB7DNFqRxQvctmotd4jyiliK8FmuJGcCcANB4od/RKFYeyg/wAhbRs6JXlPFIEufrf5/G8K7kDKEE1MJNrqBM6oqEQfBdW1ofvQ/YxV4MYofKhG/3+cBXLJ8GA4Z1wis3r/kYIUZDm8XbTMq8gmJMzyePnpvmt0s2vyEEsxyCPQVwN06dKVGqSJ9oNWEQNf7f/Ir9SQTvCEg2dGKYxDDr9okyU4OCCSOc1n0yTZRtUPMfIClqBpQnvoh4k4JpU= mahabub.hasan@NANO-DXLL"
}

resource "aws_instance" "my_server" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = [aws_security_group.sg_my_server.id]
  user_data = data.template_file.user_data.rendered

  tags = {
    Name = "MyServer"
  }
}

output "public_ip" {
  value = aws_instance.my_server.public_ip
}