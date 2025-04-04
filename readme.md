Deploy AKS Cluster using Terraform & Monitor the Deployment with Prometheus and Grafana (Helm charts) using Jenkins Pipeline:
------------------------------------------------------------
Implemented on **Windows 11** machine.

**Prerequisties:**

1. Install Java and Jenkins on your machine: https://www.jenkins.io/doc/book/installing/windows/
   
3. Install Terraform, Git, Github Plugins on Jenkins.
   
5. Configure the Github Token Credentials as Secret in Jenkins.
   
**Step 1: Generate GitHub Personal Access Token (PAT)**:
- Go to https://github.com/settings/tokens
- Click "Generate new token" (or "Fine-grained token" for more control)
- Set:
- Token name: jenkins-token (or anything you like)
- Expiration: e.g., 90 days
- Scopes: at least select:
- repo (mostly private repos or your wish)
- workflow (if using GitHub Actions)
- Click Generate token
- Copy the token – you won’t see it again.

**Step 2: Add GitHub Token as a Secret in Jenkins**
- Login to your Jenkins UI  
- Go to Manage Jenkins → Credentials  
- Choose the appropriate domain (or "Global" if unsure)  
- Click (+) Add Credentials  
- Choose:  
   - Kind: Secret text  
   - Secret: Paste your GitHub token here  
   - ID: github-token  
   - Description: (Optional) GitHub token for accessing private repos  
- Click OK

4. Azure Portal login and Active Subscription and Azure CLI.

In Azure CLI cloud do these steps for access to Terraform 
- az account list --output table
👉 Lists all your Azure subscriptions in a nice table format so you can pick the right one.

- az ad sp create-for-rbac --name terraform-sp --role Contributor --scopes /subscriptions/your-subscription-id
👉 Creates a service principal (like a bot user) with Contributor access to your subscription, so Terraform can safely manage Azure resources.

- az role assignment create --assignee <your appid> --role "Owner" --scope /subscriptions/<your-subscription-id>
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

Can find the terraform files here:   https://github.com/priyankakanna/devops-cicd-imp/tree/main/Practice_Devops/terraform

1. Variables.tf - where we will define the variables used in main.tf
2. terraform.tfvars - Declare the values for the variables
3. providers.tf - declare the providers with version
4. main.tf - main configuration file with all the resources which will be created
5. output.tf - Export some data to output file

Create AKS cluster using Terraform with Jenkins Pipeline script
---------------------------------------------------------------------

You can find the Jenkins File in this path:

https://github.com/priyankakanna/devops-cicd-imp/tree/main/Practice_Devops/jenkins


Create Dashboard in Grafana
-----------------------------------

In Grafana, we can create various kinds of dashboards as per our needs.

How to Create Kubernetes Monitoring Dashboard?

For creating a dashboard to monitor the cluster:
--------------------------------------------------------

- Click '+' button on left panel and select ‘Import’.
- Enter 12740 dashboard id under Grafana.com Dashboard.
- Click ‘Load’.
- Select ‘Prometheus’ as the endpoint under prometheus data sources drop down.
- Click ‘Import’.

This will show monitoring dashboard for all cluster nodes

------------

How to Create Kubernetes Cluster Monitoring Dashboard?
-----------------------------------------------------------------------


For creating a dashboard to monitor the cluster:

- Click '+' button on left panel and select ‘Import’.
- Enter 3119 dashboard id under Grafana.com Dashboard.
- Click ‘Load’.
- Select ‘Prometheus’ as the endpoint under prometheus data sources drop down.
- Click ‘Import’.

This will show monitoring dashboard for all cluster nodes

---------------------

Create POD Monitoring Dashboard
-----------------------------------------------
For creating a dashboard to monitor the cluster:

- Click '+' button on left panel and select ‘Import’.
- Enter 6417 dashboard id under Grafana.com Dashboard.
- Click ‘Load’.
- Select ‘Prometheus’ as the endpoint under prometheus data sources drop down.
- Click ‘Import’.

Next clean up the AKS cluster: 
--------------

Update the **DESTROY_INFRA = true** // Set to true for destruction in the Jenkinsfile.
