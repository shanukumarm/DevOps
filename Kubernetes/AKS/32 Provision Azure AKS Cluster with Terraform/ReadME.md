1. Install Terraform from:
    https://developer.hashicorp.com/terraform/downloads
    
2. Initialize Terraform
    terraform init

3. Plan Terraform:
    terraform plan
    or, 
    terraform plan -var "location=centralindia"

# list of supported Azure Locations: "australiacentral,australiacentral2,australiaeast,australiasoutheast,brazilsouth,brazilsoutheast,brazilus,canadacentral,canadaeast,centralindia,centralus,centraluseuap,eastasia,eastus,eastus2,eastus2euap,francecentral,francesouth,germanynorth,germanywestcentral,israelcentral,italynorth,japaneast,japanwest,jioindiacentral,jioindiawest,koreacentral,koreasouth,malaysiasouth,mexicocentral,northcentralus,northeurope,norwayeast,norwaywest,polandcentral,qatarcentral,southafricanorth,southafricawest,southcentralus,southeastasia,southindia,spaincentral,swedencentral,swedensouth,switzerlandnorth,switzerlandwest,uaecentral,uaenorth,uksouth,ukwest,westcentralus,westeurope,westindia,westus,westus2,westus3,austriaeast,chilecentral,eastusslv,israelnorthwest,malaysiawest,newzealandnorth,southeastasiafoundational,taiwannorth,taiwannorthwest"


4. mkdir $PWD/.ssh/aks-prod-sshkeys-terraform
5. ssh-keygen -m PEM -t rsa -b 4096 -C "azureuser@myserver" -f $PWD/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey -N mypassphrase

6. To get list of all versions available for AKS:
    az aks get-versions --location centralindia -o table


7. Verify cluster:
    az aks show --resource-group terraform-aks-dev --name terraform-aks-dev-cluster
    or,
    az aks show --resource-group terraform-aks-dev --name terraform-aks-dev-cluster -o table

8. Add configuration for current cluster in kubeconfig file:
    az aks get-credentials --resource-group terraform-aks-dev --name terraform-aks-dev-cluster --admin

9. Get current cluster details from config file:
    kubectl cluster-info

10. List of NodePools:
    az aks nodepool list --resource-group terraform-aks-dev --cluster-name terraform-aks-dev-cluster --output table




