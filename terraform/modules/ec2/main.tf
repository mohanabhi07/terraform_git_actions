data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
    count = length(var.subnet_id)
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  subnet_id = var.subnet_id[count.index]
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg_id]
  
  user_data = <<EOF
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install -y apache2 curl
  public_ip=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
  echo "<html><body><h1>Public IP Address: $public_ip</h1></body></html>" | sudo tee /var/www/html/index.html
  sudo systemctl start apache2
  sudo systemctl enable apache2
  EOF

  tags = {
    Name = "${var.project_name}-webserver-${count.index}"
  }
}