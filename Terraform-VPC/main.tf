module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  subnet_names = var.subnet_names
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  
}

module "ec2" {
  source = "./modules/ec2"  
  subnets = module.vpc.subnet_ids
  user_data = var.cmd
  key_name = var.key_name
  vpc_security_group_ids = [module.sg.sg_id] 

}

# resource "aws_instance" "test" {
  
#   ami           = "ami-0fff1b9a61dec8a5f"
#   instance_type = "t2.micro"
  
#   #vpc_security_group_ids = [var.sg_id]
#   vpc_security_group_ids    = [module.sg.sg_id]
#   associate_public_ip_address = true
#   subnet_id = module.vpc.subnet_ids[0]
 
#   availability_zone = "us-east-1a"
#   key_name = var.key_name  
  

#   monitoring      = true 

#   metadata_options {
#     http_tokens = "required"  # Forces the use of IMDSv2 (IMDSv1 will be disabled)
#     http_endpoint = "enabled" # Enables the Instance Metadata Service
#   }

#   tags = {
#     Name = "EC2 test"
#   }
# }

module "alb" {
  source = "./modules/alb"
  sg_id = module.sg.sg_id
  subnets = module.vpc.subnet_ids
  vpc_id = module.vpc.vpc_id
  intstances = module.ec2.instances

}