output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.my_eks_cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = aws_eks_cluster.my_eks_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  value       = aws_eks_cluster.my_eks_cluster.certificate_authority[0].data
}

output "node_group_name" {
  description = "The name of the EKS node group"
  value       = aws_eks_node_group.my_eks_node_group.node_group_name
}

output "node_group_status" {
  description = "The status of the EKS node group"
  value       = aws_eks_node_group.my_eks_node_group.status
}

output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = aws_eks_cluster.my_eks_cluster.id
}

output "cluster_security_group_id" {
  description = "The security group ID of the EKS cluster"
  value       = aws_eks_cluster.my_eks_cluster.vpc_config[0].cluster_security_group_id
}