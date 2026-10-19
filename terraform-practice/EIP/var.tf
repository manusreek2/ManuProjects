variable "ami_value" {
  type = string
  description = "Amazon Linux"
}

variable "instance_type" {
  type = string
  description = "Instance type"
}

variable "app_port" {
  type = number
  description = "Application port"
}

variable "ssh_port" {
  type = number
  description = "SSH port"
}