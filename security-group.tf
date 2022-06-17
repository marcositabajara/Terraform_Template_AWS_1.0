//Security Grup da Zona de N.Virginia

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"


  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidrs_acesso_remoto
  }

  tags = {
    Name = "ssh"
  }
}

//Security Group da Zona de Ohio

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2
  name        = "acesso-ssh"
  description = "acesso-ssh"


  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidrs_acesso_remoto
  }

  tags = {
    Name = "ssh"
  }
}