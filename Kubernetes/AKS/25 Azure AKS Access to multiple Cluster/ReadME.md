1. Create Resource Group:
    az group create --location centralindia --name AKS-Learning

2. Create AKS Cluster:
    az aks create --name AKS-Learning --resource-group AKS-Learning --node-count 1 --enable-managed-identity --generate-ssh-keys

3. Backup SSH Keys so you don't lose access to cluster in case of ssh key deletion:
    cd $HOME/.ssh
    mkdir BACKUP-SSH-KEYS-AKS-Clusters
    cp id_rsa* BACKUP-SSH-KEYS-AKS-Clusters
    ls -lrt BACKUP-SSH-KEYS-AKS-Clusters

4. Access Azure cluster:
    az aks get-credentials --resource-group AKS-Learning --name AKS-Learning

5. To see all the configs (file location: $HOME/.kube): 
    kubectl config view

6. To see current-context:
    kubectl config current-context

7. To switch context:
    kubectl config use-context AKS-Learning

8. To check cluster details:
    kubectl cluster-info