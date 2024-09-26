terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr                  = var.vpc_cidr
  public_subnets_cidr_blocks = var.public_subnets
  private_subnets_cidr_blocks = var.private_subnets
  availability_zones        = var.availability_zones
}

module "iam" {
  source = "./modules/iam"

  cluster_name = var.cluster_name
}

module "eks" {
  source = "./modules/eks"

  cluster_name          = var.cluster_name
  cluster_role_arn      = module.iam.eks_cluster_role_arn
  node_role_arn         = module.iam.eks_node_role_arn
  public_subnets_ids    = module.vpc.public_subnet_ids
  private_subnets_ids   = module.vpc.private_subnet_ids
  vpc_id                = module.vpc.vpc_id  # Pass the VPC ID here
  vpc_cidr              = module.vpc.vpc_cidr
  desired_size          = var.desired_size
  max_size              = var.max_size
  min_size              = var.min_size
  instance_type         = var.instance_type
  kubernetes_version    = var.kubernetes_version
  node_group_name       = var.node_group_name

  eks_cluster_policy_attachment_id                 = module.iam.eks_cluster_policy_attachment_id
  eks_vpc_resource_controller_policy_attachment_id = module.iam.eks_vpc_resource_controller_policy_attachment_id
  worker_policy_attachment_id                      = module.iam.worker_policy_attachment_id
  cni_policy_attachment_id                         = module.iam.cni_policy_attachment_id
  ec2_container_registry_policy_attachment_id      = module.iam.ec2_container_registry_policy_attachment_id

  depends_on = [module.iam]
}

