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

create simple deployment like nginx deployment with 2 or 3 replicas.

monitor AKS with Prometheus and Grafana :

Install Prometheus and Grafana using helm:

pre-requisties:
helm install in your machine

PS C:\Users\priya\devops-cicd-imp\Practice_Devops> helm repo add stable https://charts.helm.sh/stable
"stable" has been added to your repositories
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
"prometheus-community" has been added to your repositories
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> helm search repo prometheus-community

PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl create namespace prometheus
Error from server (AlreadyExists): namespaces "prometheus" already exists
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl get namespaces
NAME              STATUS   AGE
default           Active   33m
kube-node-lease   Active   33m
kube-public       Active   33m
kube-system       Active   33m
prometheus        Active   25m
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> helm install stable prometheus-community/kube-prometheus-stack -n prometheus
NAME: stable
LAST DEPLOYED: Wed Apr  2 12:41:57 2025
NAMESPACE: prometheus
STATUS: deployed
REVISION: 1
NOTES:
kube-prometheus-stack has been installed. Check its status by running:
  kubectl --namespace prometheus get pods -l "release=stable"

Get Grafana 'admin' user password by running:

  kubectl --namespace prometheus get secrets stable-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo

Access Grafana local instance:

  export POD_NAME=$(kubectl --namespace prometheus get pod -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=stable" -oname)
  kubectl --namespace prometheus port-forward $POD_NAME 3000

Visit https://github.com/prometheus-operator/kube-prometheus for instructions on how to create & configure Alertmanager and Prometheus instances using the Operator.
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> 
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl get pods -n prometheus

PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl get svc -n prometheus

PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl edit svc stable-kube-prometheus-sta-prometheus -n prometheus  ---** edit as LoadBalancer instead of clusterIP**
service/stable-kube-prometheus-sta-prometheus edited
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl edit svc stable-grafana -n prometheus   ---** edit as LoadBalancer instead of clusterIP**
service/stable-grafana edited
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl get svc -n prometheus

PS C:\Users\priya\devops-cicd-imp\Practice_Devops>

Now can access the Grafana using the above loadbalancer url http://132.196.211.25 


UserName: admin 
Password: prom-operator

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
