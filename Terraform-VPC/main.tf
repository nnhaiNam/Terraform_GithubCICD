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

resource "aws_instance" "test" {
  count                  = 0  # Ensures this doesn't actually create any resources
  vpc_security_group_ids = [module.sg.sg_id]
}

module "alb" {
  source = "./modules/alb"
  sg_id = module.sg.sg_id
  subnets = module.vpc.subnet_ids
  vpc_id = module.vpc.vpc_id
  intstances = module.ec2.instances

}