output "key_name" {
  description = "Nom de la key pair créée"
  value       = aws_key_pair.this.key_name
}

output "private_key_pem" {
  description = "Clé privée SSH (à protéger)"
  value       = tls_private_key.this.private_key_pem
  sensitive   = true
}

output "public_key" {
  description = "Clé publique SSH"
  value       = tls_private_key.this.public_key_openssh
}

output "private_key_path" {
  value = var.private_key_path
}
