1. By attaching ACR to AKS:
    1. Attach ACR to AKS:
    az aks update -n AKS-Learning -g AKS-Learning --attach-acr shanukumarm

    2. Detach ACR from AKS:
    az aks update -n AKS-Learning -g AKS-Learning --detach-acr shanukumarm

2. With Service Principal:
