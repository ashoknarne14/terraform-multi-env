resource "aws_instance" "ec2" {
    ami                     = "ami-09c813fb71547fc4f"
    instance_type           = lookup(var.instance_type, "${terraform.workspace}")
    vpc_security_group_ids   = [aws_security_group.security_group.id]

    tags = {
    Name = "devops_terraform-${terraform.workspace}"
  }
    
}

resource "aws_security_group" "security_group" {
    name        = "allow_ssh_terraform-${terraform.workspace}"
    description = "Allow ssh connections"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

    
    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
    Name = "allow_ssh_terraform-${terraform.workspace}"
  }
    
}

