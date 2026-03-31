# Outputs file
output "catapp_url" {
  value = [for dns in aws_eip.hashicat[*].public_dns : "http://${dns}"]
}

output "catapp_ip" {
  value = [for ip in aws_eip.hashicat[*].public_ip : "${ip}"]
}
