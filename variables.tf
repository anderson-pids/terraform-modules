variable "aws_profile" {
  type        = string
  description = "my profile"
  default     = "adilson-teste"
}

variable "aws_region" {
  type        = string
  description = "virginia regiao"
  default     = "us-east-1"
}

variable "instance_ami" {
  type        = string
  description = "instancia ubuntu"
  default     = "ami-054a31f1b3bf90920"
}

variable "instance_type" {
  type        = string
  description = "instancias t2"
  default     = "t3.micro"
}

variable "service_name" {
  type        = string
  description = ""
  default     = "autoscalling-app"
}