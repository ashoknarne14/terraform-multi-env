resource "aws_instance" "ec2" {
    for_each = var.instance_name

    ami                     = "ami-09c813fb71547fc4f"
    instance_type           = each.value
    vpc_security_group_ids   = [aws_security_group.security_group.id]

    tags = merge(
            var.common_tags,
            var.tags,
            {
                Name = each.key
            }

    )
       
  }
    

resource "aws_security_group" "security_group" {
    name        = "allow_ssh-${var.environment}"
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

    tags = merge(
            var.common_tags,
            var.tags,
            {
                Name = "allow_ssh-${var.environment}"
            }
    )
    
    
  }
    


