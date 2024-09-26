# EKS Cluster
resource "aws_eks_cluster" "my_eks_cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.public_subnets_ids  # Use public subnets for control plane
  }

  version = var.kubernetes_version

  tags = {
    Name = var.cluster_name
  }

  depends_on = [
    var.eks_cluster_policy_attachment_id,
    var.eks_vpc_resource_controller_policy_attachment_id
  ]
}

# Security Group for EKS Nodes
resource "aws_security_group" "eks_node_group_sg" {
  vpc_id = var.vpc_id  # Pass the VPC ID from your VPC module

  tags = {
    Name = "${var.cluster_name}-node-group-sg"
  }
}

# Inbound Rule for Worker Nodes
resource "aws_security_group_rule" "allow_inbound_from_control_plane" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.eks_node_group_sg.id
  cidr_blocks       = [var.vpc_cidr]  # Allow traffic from the VPC CIDR
}

# Outbound Rule for Worker Nodes
resource "aws_security_group_rule" "allow_outbound_internet" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.eks_node_group_sg.id
  cidr_blocks       = ["0.0.0.0/0"]  # Allow all outbound traffic
}

# EKS Node Group
resource "aws_eks_node_group" "my_eks_node_group" {
  cluster_name    = aws_eks_cluster.my_eks_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnets_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = [var.instance_type]
  ami_type       = "AL2_x86_64"  # EKS will automatically select the latest Amazon EKS-optimized AMI

  tags = {
    Name = var.node_group_name
  }

  depends_on = [
    aws_eks_cluster.my_eks_cluster,
    var.worker_policy_attachment_id,
    var.cni_policy_attachment_id,
    var.ec2_container_registry_policy_attachment_id
  ]
}
