https://github.com/antonputra/tutorials/tree/main/lessons/038

1. terraform init
2. terraform plan
3. terraform apply
4. aws eks update-config --region ap-south-1 --name eks-cluster
5. kubectl apply -f kubernetes/sample-app/
6. kubectl apply -f rbac/

7. create EKS reader user group and user on AWS
8. aws configure --profile profile_name    ## login with new user credentials
9. kubectl edit -n kube-system configmapp/aws-auth
    1. Add new user:
        data:
            mapusers: |
                userarn: ## provide user arn
                username: ## keep same as username
                groups:
                - reader
    2. Save it
10. aws eks update-config --region ap-south-1 --name eks-cluster --profile username    ## to check access with new user
11. kubectl auth can-i get pods
    or,
    kubectl get pods

    kubectl auth can-i create pods
    or,
    kubectl run nginx --image=nginx

12. create EKS developer or admin user group and user on AWS
13. aws configure --profile profile_name    ## login with new user credentials
14. kubectl edit -n kube-system configmapp/aws-auth
    1. Add new user:
        data:
            mapusers: |
                userarn: ## provide user arn
                username: ## keep same as username
                groups:
                - reader
    2. Save it
15. aws eks update-config --region ap-south-1 --name eks-cluster --profile username    ## to check access with new user
16. kubectl auth can-i get pods
    or,
    kubectl get pods

    kubectl auth can-i create pods
    or,
    kubectl run nginx --image=nginx
