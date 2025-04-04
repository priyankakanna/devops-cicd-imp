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

- You can find the Jenkins File in this path:

      https://github.com/priyankakanna/devops-cicd-imp/tree/main/Practice_Devops/jenkins

- Create Jenkins Pipeline with the Jenkins Pipeline Script and run manually Build now.

- Pipeline Success:

![image](https://github.com/user-attachments/assets/704d828e-6baf-452c-b421-982b8ac613f7)

![image](https://github.com/user-attachments/assets/ae954b7f-22fd-428c-a187-9ab585352f3d)


![image](https://github.com/user-attachments/assets/bea796fd-ee05-42dd-8ace-be3ccda4c8f8)

![image](https://github.com/user-attachments/assets/d8cfe80b-731f-40ad-84a6-acd9226b6253)

- On Console output we can find the Urls for the Prometheus and Grafana to access: 

![image](https://github.com/user-attachments/assets/78d7329d-f52e-4c9c-8de9-26de170454eb)


- Resources created on Azure Portal:

![image](https://github.com/user-attachments/assets/4bdf983f-188f-403d-94da-a5ef165eb204)

   - Resource Group:

![image](https://github.com/user-attachments/assets/e0fce31c-0d42-4d1e-95f6-297c92e8d2d7)


   - Azure Container Registery:

![image](https://github.com/user-attachments/assets/53aace0b-3c6d-42e3-878b-edacf25ab9a7)

   - AKS cluster with workloads:

![image](https://github.com/user-attachments/assets/1b3f5b3b-b80d-4f8e-9b51-30653055f613)

![image](https://github.com/user-attachments/assets/bed039b9-ea54-465c-afd4-856d648edd7c)

Prometheus dashboard:
---------------------------------
We can configure the Alert Manager and other things according to our requirement.

![image](https://github.com/user-attachments/assets/dcd95124-91e7-4ef1-afd5-de8001e6a20e)


Grafana Dashboard:
---------------------------

![image](https://github.com/user-attachments/assets/bb7979de-753d-4400-9465-e7743e4b73fa)


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

![image](https://github.com/user-attachments/assets/fe8528ef-4768-48bc-a800-262e94d8604e)


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

![image](https://github.com/user-attachments/assets/79b2c036-7207-4dbf-aab0-46b93f2fd328)

![image](https://github.com/user-attachments/assets/5bed7330-a61a-4950-8bfa-5f34e8e00670)


Create POD Monitoring Dashboard
-----------------------------------------------
For creating a dashboard to monitor the cluster:

- Click '+' button on left panel and select ‘Import’.
- Enter 6417 dashboard id under Grafana.com Dashboard.
- Click ‘Load’.
- Select ‘Prometheus’ as the endpoint under prometheus data sources drop down.
- Click ‘Import’.

  ![image](https://github.com/user-attachments/assets/77e50c11-45df-4b40-be27-a6044be3d615)


Next clean up the AKS cluster: 
--------------

Update the **DESTROY_INFRA = true** // Set to true for destruction in the Jenkinsfile.

Pipeline Success and Resources Deleted on Azure :

![image](https://github.com/user-attachments/assets/06456ed2-e3ba-460b-9956-2aeb1030c44f)


![image](https://github.com/user-attachments/assets/72e2f9f2-31e2-4493-a0a0-d394f5692061)

Resouces Deleted on Azure Portal:

![image](https://github.com/user-attachments/assets/fa3c0a8d-e139-4094-8ceb-e546d77fd443)

Prometheus not accessible:

![image](https://github.com/user-attachments/assets/fcf6cddb-7bba-4ed7-88c4-c5b0dfe67032)

Grafana not accessible:

![image](https://github.com/user-attachments/assets/48b5e566-d334-4b1e-9cb3-567657deb61e)



