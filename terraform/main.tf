resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("key-web-deployment.pub")
}

resource "aws_instance" "k8s_node" {
  ami           = "ami-07d2649d67dbe8900"  # Amazon Linux 2
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "KubernetesNode"
  }
}