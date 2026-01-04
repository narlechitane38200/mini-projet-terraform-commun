variable "key_name" {
  description = "Nom de la paire de clés EC2"
  type        = string
}

variable "tags" {
  description = "Tags à appliquer à la key pair"
  type        = map(string)
  default     = {}
}

variable "private_key_path" {
  type        = string
  description = "Chemin local où écrire la clé privée"
}
