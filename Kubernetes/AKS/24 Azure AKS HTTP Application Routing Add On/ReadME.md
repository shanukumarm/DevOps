1. Enable add-on for HTTP application routing
    az aks enable-addons --resource-group AKS-Learning --name AKS-Learning --addons http_application_routing

2. Check attached DNS zone name:
    az aks show --resource-group AKS-Learning --name AKS-Learning --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName -o table

3. nslookup to check dns is synced (it takes sometime to sync, 2-3 minutes generally):
    nslookup app1.c0532092843b4534bf4c.centralindia.aksapp.io

4. Check http addon logs:
    kubectl -n kube-system logs -f $(kubectl -n kube-system get po | egrep -o 'addon-http-application-routing-external-dns-[A-Za-z0-9-]+')

5. Disable the add-on:
    az aks disable-addons --addons http_application_routing --name AKS-Learning --resource-group AKS-Learning --no-wait