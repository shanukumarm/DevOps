1. Get AKS Cluster id on Windows:
    $AKS_CLUSTER_ID = $(az aks show --resource-group AKS-Learning --name AKS-Learning --query id -o tsv)
    
    Write-output $AKS_CLUSTER_ID
    or
    echo $AKS_CLUSTER_ID

2. Create Azure AD Group:
    $DEV_AKS_GROUP_ID = $(az ad group create --display-name aks-devs --mail-nickname aks-devs --query id -o tsv)

3. Create Role Assignment :
    az role assignment create --assignee $DEV_AKS_GROUP_ID --scope $AKS_CLUSTER_ID --role 'Azure Kubernetes Service Cluster User Role'

4. Create Dev User:
    $DEV_AKS_USER_OBJECT_ID = $(az ad user create --display-name "AKS Dev 1" --user-principal-name aksdev1@shanukumarmgmail.onmicrosoft.com --password '@AKSDemo123' --query id -o tsv)

    echo $DEV_AKS_USER_OBJECT_ID

5. Add user to the group:
    az ad group member add --group $DEV_AKS_GROUP_ID --member-id $DEV_AKS_USER_OBJECT_ID


6. kubectl apply -f ./rbac/

7. kubectl apply -f ./myapp/

8. kubectl get po

9. kubectl get po -n dev