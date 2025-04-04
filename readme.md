Deploy AKS Cluster using Terraform & Monitor the Deployment with Prometheus and Grafana (Helm charts) using Jenkins Pipeline:
------------------------------------------------------------
I had done this in Windows 11 machine.
Prerequisties:
1. Install Java and Jenkins on your machine.
2. Install Terraform, Git, Github Plugins on Jenkins.
3. Configure the Github Token Credentials as Secret in Jenkins.
4. Azure Portal login and Active Subscription and Azure CLI.

In Azure CLI cloud do these steps for access to Terraform 
az account list --output table
👉 Lists all your Azure subscriptions in a nice table format so you can pick the right one.

az ad sp create-for-rbac --name terraform-sp --role Contributor --scopes /subscriptions/your-subscription-id
👉 Creates a service principal (like a bot user) with Contributor access to your subscription, so Terraform can safely manage Azure resources.

az role assignment create --assignee <your appid> --role "Owner" --scope /subscriptions/<your-subscription-id>
👉 Gives Owner access to that service principal, allowing it to do everything (including assigning roles) inside your subscription.

Will get the details as below:
{
  "appId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "displayName": "terraform-sp",
  "password": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "tenant": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}                                                    

5. Configure the Azure Credentials as Env Variables in Jenkins retrieved from above as ARM_CLIENT_ID, ARM_CLIENT_SECRET & ARM_TENANT_ID .

Let's create following tf files using Visual studio Code:

1. Variables.tf - where we will define the variables used in main.tf
2. terraform.tfvars - Declare the values for the variables
3. providers.tf - declare the providers with version
4. main.tf - main configuration file with all the resources which will be created
5. output.tf - Export some data to output file

Create AKS cluster using Terraform with Jenkins Pipeline script
---------------------------------------------------------------------




Create Dashboard in Grafana
-----------------------------------

In Grafana, we can create various kinds of dashboards as per our needs.

How to Create Kubernetes Monitoring Dashboard?

For creating a dashboard to monitor the cluster:
--------------------------------------------------------

Click '+' button on left panel and select ‘Import’.

Enter 12740 dashboard id under Grafana.com Dashboard.

Click ‘Load’.

Select ‘Prometheus’ as the endpoint under prometheus data sources drop down.

Click ‘Import’.

This will show monitoring dashboard for all cluster nodes

------------

How to Create Kubernetes Cluster Monitoring Dashboard?
-----------------------------------------------------------------------


For creating a dashboard to monitor the cluster:

Click '+' button on left panel and select ‘Import’.

Enter 3119 dashboard id under Grafana.com Dashboard.

Click ‘Load’.

Select ‘Prometheus’ as the endpoint under prometheus data sources drop down.

Click ‘Import’.

This will show monitoring dashboard for all cluster nodes

---------------------

Create POD Monitoring Dashboard
-----------------------------------------------
For creating a dashboard to monitor the cluster:

Click '+' button on left panel and select ‘Import’.

Enter 6417 dashboard id under Grafana.com Dashboard.

Click ‘Load’.

Select ‘Prometheus’ as the endpoint under prometheus data sources drop down.

Click ‘Import’.

--------------

![image](https://github.com/user-attachments/assets/5e6c1fce-a741-4628-a565-b0e0016654b8)



Next clean up the AKS cluster using terraform destroy -auto-approve.
