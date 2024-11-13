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
  sg_id = [module.sg.sg_id] # Passing as a list to match EC2 parameter requirements
  subnets = module.vpc.subnet_ids
  user_data = var.cmd
  key_name = var.key_name
  
}

module "alb" {
  source = "./modules/alb"
  sg_id = module.sg.sg_id
  subnets = module.vpc.subnet_ids
  vpc_id = module.vpc.vpc_id
  intstances = module.ec2.instances

}