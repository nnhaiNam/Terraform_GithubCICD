variable "vpc_security_group_ids" {
    description = "SG ID for EC2"
    type = list(string) 
}

variable "subnets" {
    description = "Subnets for EC2"
    type = list(string)
  
}

variable "ec2_names" {
    description = "EC2 names"
    type = list(string)
    default = [ "WebServer1Harinem","WebServer2Harinem" ]
}

variable "user_data" {
    description = "Command for EC2"
    type = string
    
  
}

variable "key_name" {
    description = "File pem"
    type = string
  
}