resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

module "subnets" {
  source = "./modules/subnets"
}


module "igw" {
  source = "./modules/igw"
}


module "public_route" {
  source = "./modules/public_route"
}


module "private_route" {
  source = "./modules/private_route"
}
