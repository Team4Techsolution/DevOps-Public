variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the EKS worker nodes"
  type        = string
}

variable "public_subnets_ids" {
  description = "List of public subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "private_subnets_ids" {
  description = "List of private subnet IDs for the EKS worker nodes"
  type        = list(string)
}

variable "kubernetes_version" {
  description = "The version of the Kubernetes cluster"
  type        = string
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "desired_size" {
  description = "The desired number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "The maximum number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "The minimum number of worker nodes"
  type        = number
}

variable "instance_type" {
  description = "The instance type for the worker nodes"
  type        = string
}

variable "eks_cluster_policy_attachment_id" {
  description = "The ID of the EKS cluster policy attachment"
  type        = string
}

variable "eks_vpc_resource_controller_policy_attachment_id" {
  description = "The ID of the EKS VPC resource controller policy attachment"
  type        = string
}

variable "worker_policy_attachment_id" {
  description = "The ID of the worker policy attachment"
  type        = string
}

variable "cni_policy_attachment_id" {
  description = "The ID of the CNI policy attachment"
  type        = string
}

variable "ec2_container_registry_policy_attachment_id" {
  description = "The ID of the EC2 container registry policy attachment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to associate with the EKS node group"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}
