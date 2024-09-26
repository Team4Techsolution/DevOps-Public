output "eks_cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  description = "The ARN of the IAM role for the EKS worker nodes"
  value       = aws_iam_role.eks_node_role.arn
}

output "alb_controller_role_arn" {
  description = "The ARN of the IAM role for the AWS Load Balancer Controller"
  value       = aws_iam_role.alb_controller_role.arn
}

output "eks_cluster_policy_attachment_id" {
  description = "The ID of the EKS cluster policy attachment"
  value       = aws_iam_role_policy_attachment.eks_cluster_policy.id
}

output "eks_vpc_resource_controller_policy_attachment_id" {
  description = "The ID of the EKS VPC resource controller policy attachment"
  value       = aws_iam_role_policy_attachment.eks_vpc_resource_controller_policy.id
}

output "worker_policy_attachment_id" {
  description = "The ID of the worker policy attachment"
  value       = aws_iam_role_policy_attachment.worker_policy.id
}

output "cni_policy_attachment_id" {
  description = "The ID of the CNI policy attachment"
  value       = aws_iam_role_policy_attachment.cni_policy.id
}

output "ec2_container_registry_policy_attachment_id" {
  description = "The ID of the EC2 container registry policy attachment"
  value       = aws_iam_role_policy_attachment.ec2_container_registry_policy.id
}

output "alb_controller_sa_name" {
  description = "The name of the ALB controller service account"
  value       = "aws-load-balancer-controller"  # or whatever name you're using
}