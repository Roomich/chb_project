data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

data "aws_key_pair" "selected" {
    key_name           = var.aws_key_pair_name
    include_public_key = true
}

resource "aws_instance" "kube" {
    ami             = data.aws_ami.ubuntu.image_id
    instance_type   = "t2.medium"
    key_name        = data.aws_key_pair.selected.key_name
    security_groups = [aws_security_group.allow_ssh.name, aws_security_group.allow_web.name, aws_security_group.allow_kube.name, aws_security_group.allow_docker.name]
    associate_public_ip_address = true
    user_data = "${file("init.sh")}"

    root_block_device {
        volume_size = "16"
    }

    tags = {
        Name = "kubernetes"
    }
}

resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"

    ingress {
        description = "SSH from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_ssh"
    }
}

resource "aws_security_group" "allow_web" {
    name        = "allow_web"
    description = "Allow HTTP/HTTPS inbound traffic"

    ingress {
        description = "HTTP from VPC"
        from_port   = 9292
        to_port     = 9292
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_web"
    }
}

resource "aws_security_group" "allow_kube" {
    name        = "allow_kube"
    description = "Allow kubernetes API"

    ingress {
        description = "kubernetes api"
        from_port   = 6443
        to_port     = 6443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_kube"
    }
}

resource "aws_security_group" "allow_docker" {
    name        = "allow_docker"
    description = "Allow docker"

    ingress {
        description = "docker tcp"
        from_port   = 2375
        to_port     = 2375
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "docker tcp"
        from_port   = 2376
        to_port     = 2376
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_docker"
    }
}