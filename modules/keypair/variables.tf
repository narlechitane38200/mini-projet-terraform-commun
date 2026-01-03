variable "key_name" {
  description = "Nom de la paire de clés EC2"
  type        = string
}

variable "tags" {
  description = "Tags à appliquer à la key pair"
  type        = map(string)
  default     = {}
}
