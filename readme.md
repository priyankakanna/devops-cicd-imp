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

PS C:\Users\priya\devops-cicd-imp\Practice_Devops> helm repo add stable https://charts.helm.sh/stable
"stable" has been added to your repositories
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
"prometheus-community" has been added to your repositories
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> helm search repo prometheus-community
NAME                                                    CHART VERSION   APP VERSION     DESCRIPTION
prometheus-community/alertmanager                       1.16.1          v0.28.1         The Alertmanager handles alerts sent by client ...
prometheus-community/alertmanager-snmp-notifier         0.4.0           v1.6.0          The SNMP Notifier handles alerts coming from Pr...
prometheus-community/jiralert                           1.7.2           v1.3.0          A Helm chart for Kubernetes to install jiralert
prometheus-community/kube-prometheus-stack              70.4.1          v0.81.0         kube-prometheus-stack collects Kubernetes manif...
prometheus-community/kube-state-metrics                 5.31.0          2.15.0          Install kube-state-metrics to generate and expo...
prometheus-community/prom-label-proxy                   0.11.0          v0.11.0         A proxy that enforces a given label in a given ...
prometheus-community/prometheus                         27.7.1          v3.2.1          Prometheus is a monitoring system and time seri...
prometheus-community/prometheus-adapter                 4.13.0          v0.12.0         A Helm chart for k8s prometheus adapter
prometheus-community/prometheus-blackbox-exporter       9.4.0           v0.26.0         Prometheus Blackbox Exporter
prometheus-community/prometheus-cloudwatch-expo...      0.27.0          0.16.0          A Helm chart for prometheus cloudwatch-exporter
prometheus-community/prometheus-conntrack-stats...      0.5.17          v0.4.26         A Helm chart for conntrack-stats-exporter
prometheus-community/prometheus-consul-exporter         1.0.0           0.4.0           A Helm chart for the Prometheus Consul Exporter
prometheus-community/prometheus-couchdb-exporter        1.0.0           1.0             A Helm chart to export the metrics from couchdb...
prometheus-community/prometheus-druid-exporter          1.1.1           v0.11.0         Druid exporter to monitor druid metrics with Pr...
prometheus-community/prometheus-elasticsearch-e...      6.7.1           v1.9.0          Elasticsearch stats exporter for Prometheus
prometheus-community/prometheus-fastly-exporter         0.5.1           v9.0.1          A Helm chart for the Prometheus Fastly Exporter
prometheus-community/prometheus-ipmi-exporter           0.6.0           v1.10.0         This is an IPMI exporter for Prometheus.
prometheus-community/prometheus-json-exporter           0.16.0          v0.7.0          Install prometheus-json-exporter
prometheus-community/prometheus-kafka-exporter          2.12.1          v1.9.0          A Helm chart to export the metrics from Kafka i...
prometheus-community/prometheus-memcached-exporter      0.4.0           v0.15.0         Prometheus exporter for Memcached metrics
prometheus-community/prometheus-modbus-exporter         0.1.3           0.4.1           A Helm chart for prometheus-modbus-exporter
prometheus-community/prometheus-mongodb-exporter        3.11.1          0.43.1          A Prometheus exporter for MongoDB metrics
prometheus-community/prometheus-mysql-exporter          2.9.1           v0.17.2         A Helm chart for prometheus mysql exporter with...
prometheus-community/prometheus-nats-exporter           2.18.0          0.16.0          A Helm chart for prometheus-nats-exporter
prometheus-community/prometheus-nginx-exporter          1.2.0           1.4.1           A Helm chart for NGINX Prometheus Exporter
prometheus-community/prometheus-node-exporter           4.45.0          1.9.0           A Helm chart for prometheus node-exporter
prometheus-community/prometheus-opencost-exporter       0.1.2           1.108.0         Prometheus OpenCost Exporter
prometheus-community/prometheus-operator                9.3.2           0.38.1          DEPRECATED - This chart will be renamed. See ht...
prometheus-community/prometheus-operator-admiss...      0.21.0          0.81.0          Prometheus Operator Admission Webhook
prometheus-community/prometheus-operator-crds           19.0.0          v0.81.0         A Helm chart that collects custom resource defi...
prometheus-community/prometheus-pgbouncer-exporter      0.6.0           v0.10.2         A Helm chart for prometheus pgbouncer-exporter
prometheus-community/prometheus-pingdom-exporter        3.3.0           v0.4.0          A Helm chart for Prometheus Pingdom Exporter
prometheus-community/prometheus-pingmesh-exporter       0.4.1           v1.2.2          Prometheus Pingmesh Exporter
prometheus-community/prometheus-postgres-exporter       6.10.0          v0.17.0         A Helm chart for prometheus postgres-exporter
prometheus-community/prometheus-pushgateway             3.0.0           v1.11.0         A Helm chart for prometheus pushgateway
prometheus-community/prometheus-rabbitmq-exporter       2.1.1           1.0.0           Rabbitmq metrics exporter for prometheus
prometheus-community/prometheus-redis-exporter          6.9.0           v1.67.0         Prometheus exporter for Redis metrics
prometheus-community/prometheus-smartctl-exporter       0.13.0          v0.13.0         A Helm chart for Kubernetes
prometheus-community/prometheus-snmp-exporter           9.2.0           v0.28.0         Prometheus SNMP Exporter
prometheus-community/prometheus-sql-exporter            0.2.2           v0.5.9          Prometheus SQL Exporter
prometheus-community/prometheus-stackdriver-exp...      4.8.2           v0.18.0         Stackdriver exporter for Prometheus
prometheus-community/prometheus-statsd-exporter         0.15.0          v0.28.0         A Helm chart for prometheus stats-exporter
prometheus-community/prometheus-systemd-exporter        0.5.0           0.7.0           A Helm cprometheus-community/prometheus-smartctl-exporter    hart for prometheus systemd-exporter
prometheus-community/prometheus-to-sd                   0.4.2           0.5.2           Scrape metrics stored in prometheus format and ...
prometheus-community/prometheus-windows-exporter        0.9.2           0.30.5          A Helm chart for prometheus windows-exporter
prometheus-community/prometheus-yet-another-clo...      0.40.0          v0.62.1         Yace - Yet Another CloudWatch Exporter
prometheus-community/yet-another-cloudwatch-exp...      0.39.1          v0.62.1         Yace - Yet Another CloudWatch Exporter
PS C:\Users\priya\devops-cicd-imp\Practice_Devops>
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
NAME                                                     READY   STATUS    RESTARTS   AGE
alertmanager-stable-kube-prometheus-sta-alertmanager-0   2/2     Running   0          32s
prometheus-stable-kube-prometheus-sta-prometheus-0       2/2     Running   0          32s
stable-grafana-78f5db59b4-z2f7t                          2/3     Running   0          40s
stable-kube-prometheus-sta-operator-7d8b67f58b-tgnhr     1/1     Running   0          40s
stable-kube-state-metrics-7955c7899c-nzvbh               1/1     Running   0          40s
stable-prometheus-node-exporter-896rn                    1/1     Running   0          40s
stable-prometheus-node-exporter-t88g8                    1/1     Running   0          40s
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl get svc -n prometheus
NAME                                      TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                      AGE
alertmanager-operated                     ClusterIP   None           <none>        9093/TCP,9094/TCP,9094/UDP   40s
prometheus-operated                       ClusterIP   None           <none>        9090/TCP                     40s
stable-grafana                            ClusterIP   10.0.78.70     <none>        80/TCP                       48s
stable-kube-prometheus-sta-alertmanager   ClusterIP   10.0.242.35    <none>        9093/TCP,8080/TCP            48s
stable-kube-prometheus-sta-operator       ClusterIP   10.0.88.219    <none>        443/TCP                      48s
stable-kube-prometheus-sta-prometheus     ClusterIP   10.0.5.45      <none>        9090/TCP,8080/TCP            48s
stable-kube-state-metrics                 ClusterIP   10.0.162.119   <none>        8080/TCP                     48s
stable-prometheus-node-exporter           ClusterIP   10.0.228.206   <none>        9100/TCP                     48s
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl edit svc stable-kube-prometheus-sta-prometheus -n prometheus  ---** edit as LoadBalancer instead of clusterIP**
service/stable-kube-prometheus-sta-prometheus edited
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl edit svc stable-grafana -n prometheus   ---** edit as LoadBalancer instead of clusterIP**
service/stable-grafana edited
PS C:\Users\priya\devops-cicd-imp\Practice_Devops> kubectl get svc -n prometheus
NAME                                      TYPE           CLUSTER-IP     EXTERNAL-IP       PORT(S)                         AGE
alertmanager-operated                     ClusterIP      None           <none>            9093/TCP,9094/TCP,9094/UDP      2m56s
prometheus-operated                       ClusterIP      None           <none>            9090/TCP                        2m56s
stable-grafana                            LoadBalancer   10.0.78.70     132.196.211.25    80:30108/TCP                    3m4s
stable-kube-prometheus-sta-alertmanager   ClusterIP      10.0.242.35    <none>            9093/TCP,8080/TCP               3m4s
stable-kube-prometheus-sta-operator       ClusterIP      10.0.88.219    <none>            443/TCP                         3m4s
stable-kube-prometheus-sta-prometheus     LoadBalancer   10.0.5.45      132.196.210.239   9090:30867/TCP,8080:31134/TCP   3m4s
stable-kube-state-metrics                 ClusterIP      10.0.162.119   <none>            8080/TCP                        3m4s
stable-prometheus-node-exporter           ClusterIP      10.0.228.206   <none>            9100/TCP                        3m4s
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
