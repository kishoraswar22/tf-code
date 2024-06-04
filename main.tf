resource "aws_instance" "web2" {
  ami                    = "ami-0d191299f2822b1fa"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.aws-sg1.id]
  key_name               = aws_key_pair.key-tf.key_name
  associate_public_ip_address = true

  tags = {
    Name : "tf-web2"
  }
}

resource "aws_key_pair" "key-tf" {

  key_name   = "tf-key"
  public_key = file("${path.module}/id_rsa.pub")

}
resource "aws_security_group" "aws-sg1" {
  name = "terraform-aws-SG2"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}



