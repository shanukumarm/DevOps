1. Get AKS Cluster id on Windows:
    $AKS_CLUSTER_ID = $(az aks show --resource-group AKS-Learning --name AKS-Learning --query id -o tsv)
    
    Write-output $AKS_CLUSTER_ID
    or
    echo $AKS_CLUSTER_ID

2. Create Azure AD Group:
    $AKS_READONLY_GROUP_ID = $(az ad group create --display-name aks-reader --mail-nickname aks-reader --query id -o tsv)

    echo $AKS_READONLY_GROUP_ID

3. Create Role Assignment :
    az role assignment create --assignee $AKS_READONLY_GROUP_ID --scope $AKS_CLUSTER_ID --role 'Azure Kubernetes Service Cluster User Role'

4. Create Dev User:
    $AKS_READONLY_USER_OBJECT_ID = $(az ad user create --display-name "AKS Reader 1" --user-principal-name aksreader1@shanukumarmgmail.onmicrosoft.com --password '@AKSDemo123' --query id -o tsv)

    echo $AKS_READONLY_USER_OBJECT_ID

5. Add user to the group:
    az ad group member add --group $AKS_READONLY_GROUP_ID --member-id $AKS_READONLY_USER_OBJECT_ID


6. kubectl apply -f ./cluster-rbac/

8. kubectl get po --all-namespaces

9. kubectl get node

10. kubectl create node  # This should fail