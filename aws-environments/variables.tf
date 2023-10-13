variable "project_name" {
  type    = string
  default = "devops-project"
}

variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "cluster_version" {
  type    = string
  default = "1.27"
}

variable "workers_size" {
  type    = list
  default = ["t3.micro"]
}

variable "auto_scale_options" {
  default = {
    desired = 1
    min     = 1
    max     = 2
  }
}