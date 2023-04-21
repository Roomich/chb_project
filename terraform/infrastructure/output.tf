output "aws_instance_kube_ip" {
  value = aws_instance.kube.private_ip
}