variable "ami_value" {
  type = string
  default = "ami-0567589d25e06853e"
  description = "Amazon Linux"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Instance type"
}

variable "app_port" {
  type = number
  default = 8080
  description = "Application port"
}

variable "ssh_port" {
  type = number
  default = 22
  description = "SSH port"
}