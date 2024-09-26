This Terraform Project provisions a custom VPC, IAM Roles, EKS Cluster and Worker Nodes.

## Replace below tfvars with your own values:

```
region = 
vpc_cidr = 
public_subnets = 
private_subnets = 
availability_zones = 
cluster_name = 
desired_size = 
max_size = 
min_size = 
instance_type = 
kubernetes_version = 
node_group_name = 
kubeconfig_path = 
namespace = 

```