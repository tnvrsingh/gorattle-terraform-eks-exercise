# gorattle-terraform-eks-exercise

### Docker 

Log file attached in `docker/terraform-apply.log`
Please find the image [here on Dockerhub](https://hub.docker.com/repository/docker/tanvirsingh/gorattle-experiment/tags?page=1&ordering=last_updated)

### VPC with EKS
Validated. Working with VPC, namespace, deployment (with the above created image), service and it's endpoint.

### How to run

Before these commands, please make sure AWS credentials are set up.

```
terraform validate
terraform plan
terraform apply
```

### Context for Terraform plan failure

If you check the `vpc-wth-eks/terraform-validate-plan.log` file, it shows 1 error. Context for this error:

Since I haven't exported the file and set the context, this error is expected.

As part of creating the cluster, we need to output the `kubeconfig` and set it in the context in the terraform code.

`terraform validate` is passing.