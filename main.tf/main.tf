
resource "aws_key_pair" "my_key" {
    key_name = "adam"
    public_key = file("adam.pub")
  
}
resource "aws_default_vpc" "default" {
  
}
resource "aws_security_group" "my_security_group" {
    name = "automate_sg"
    vpc_id = aws_default_vpc.default.id
    description = ":this is a simple security group"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.o0.0.0./0"]
        description = "sc"
    }
    tags = {
      name = "automate_sg"
    }
  
}



resource "aws_instance" "key_instance" {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = "t2.micro"
    ami = var.aws_vphbsdvnbxnb

    root_block_device {
      volume_size = var.ec2_root_block_size
      volume_type = gp3
    }
  
}
tags = {
    name = "ksnn"
}