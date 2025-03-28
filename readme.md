Create AKS cluster using Terraform:

Prerequisties:

1. Install Terraform on your machine.
2. Azure Portal login and Active Subscription.
3. Install Kubectl on your machine.
4. Azure CLI is installed.

Let's create following tf files using Visual studio Code:

1. Variables.tf - where we will define the variables used in main.tf
2. terraform.tfvars - Declare the values for the variables
3. providers.tf - declare the providers with version
4. main.tf - main configuration file with all the resources which will be created
5. output.tf - Export some data to output file

To create AKS using Terraform
1. terraform init
2. terraform Validate
3. terraform Plan
4. terraform apply or terraform apply -auto-approve

Move the generated Kubeconfig file to ~/.kube/config
mv kubeconfig ~/.kube/config

kubectl get nodes
