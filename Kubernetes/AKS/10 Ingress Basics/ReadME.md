kubectl create ns ingress-basic

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm repo add stable https://charts.helm.sh/stable

helm repo update

helm show values ingress-nginx/ingress-nginx

helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-basic --set controller.replicaCount=2 --set controller.service.externalTrafficPolicy=Local --set controller.service.loadBalancerIP="20.219.135.254" # public ip (elastic ip)

# validate 
kubectl --namespace ingress-basic get services -o wide -w ingress-nginx-controller
kubectl get pod -n ingress-basic
kubectl get all -n ingress-basic

kubectl apply -f .\myapp\

kubectl get po,svc,ing

kubectl get po -n ingress-basic 

kubectl logs -f ingress-nginx-controller-8669789bc9-kvn2v -n ingress-basic

kubectl get ing

access the service using Address from ingress