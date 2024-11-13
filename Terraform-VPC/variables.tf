variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string     
}

variable "subnet_cidr" {
    description = "Subnet CIDR"
    type = list(string)
  
}

variable "subnet_names" {
    description = "Subnet names"
    type = list(string)
    default = [ "PublicSubnet1","PublicSubet2" ]
  
}

variable "cmd" {
    description = "User command"
    type = string
  
}

variable "key_name" {
    description = "Key Name"
    type = string  
}

