1. Create environment variables:
    1. $RESOURCE_GROUP='AKS-Learning'
    2. $REGION='centralindia
    3. $AKS_CLUSTER='AKS-Learning'

2. Create Resource Group:
    az group create --location ${REGION} --name ${RESOURCE_GROUP}

3. Create AKS Cluster:
    az aks create --resource-group ${RESOURCE_GROUP} --name ${AKS_CLUSTER} --enable-managed-identity --generate-ssh-keys --node-count 1 --enable-cluster-autoscaler --min-count 1 --max-count 2

4. Access the cluster:
    az aks get-credentials --resource-group ${RESOURCE_GROUP} --name ${AKS_CLUSTER}
