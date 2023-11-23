1. Limitations of virtual nodes:
https://learn.microsoft.com/en-us/azure/aks/virtual-nodes#known-limitations

2. https://learn.microsoft.com/en-us/azure/aks/virtual-nodes-cli

3. https://learn.microsoft.com/en-us/azure/aks/virtual-nodes-portal


4. Enable 'Microsoft.ContainerInstance' resource provider for subscription

5. Create cluster or if cluster is created delete already scheduled pods for virtual node

6. To check logs of aci container, this container will schedule the pod to virtual node and logs will show it:
'kubectl logs -f $(kubectl grt po -n kube-system | egrep -o 'aci-connector-linux-[A-Za-z0-9-]+') -n kube-system'


