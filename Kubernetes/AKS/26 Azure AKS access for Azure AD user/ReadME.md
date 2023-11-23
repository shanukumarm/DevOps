1. Install kubelogin:
    https://azure.github.io/kubelogin/install.html

2. To overwrite current access:
    az aks get-credentials --resource-group AKS-Learning --name AKS-Learning --overwrite-existing

3. Configure azure-cli for kubelogin:
    kubelogin convert-kubeconfig -l azurecli

4. Get resource by:
    kubectl get node

    then login with Azure AD user by providing code from command prompt

