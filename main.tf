terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.18.0"
    }
  }
}

//Instâncias 

provider "aws" {
  region =  "us-east-1"

}

provider "aws" {
  alias = "us-east-2"
  region =  "us-east-2"

}

resource "aws_instance" "dev" {
  count = 3
  ami = "${var.amis["us-east-1"]}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    Name = "dev${count.index}"
  } 

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev2" {
  ami = "${var.amis["us-east-1"]}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    Name = "dev2"
  } 

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_s3_bucket.dev2]
}


resource "aws_instance" "dev3" {
  ami = "${var.amis["us-east-1"]}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    Name = "dev3"
  } 

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
  provider = aws.us-east-2
  ami = "${var.amis["us-east-2"]}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    Name = "dev4"
  } 

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

resource "aws_instance" "dev5" {
  provider = aws.us-east-2
  ami = "${var.amis["us-east-2"]}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    Name = "dev5"
  } 

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}

//Banco de Dados

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}

// S3 Bucket

resource "aws_s3_bucket" "dev4" {
  bucket = "balde-dev4"

  tags = {
    Name        = "balde-dev4"
    Environment = "Dev"
  }
}





