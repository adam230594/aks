#https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-on-digitalocean-kubernetes-using-helm

#Step 1 — Setting Up Hello World Deployments

kubectl create -f hello-kubernetes-first.yaml
kubectl get service hello-kubernetes-first
kubectl create -f hello-kubernetes-second.yaml
kubectl get service

#Step 2 — Installing the Kubernetes Nginx Ingress Controller

helm install stable/nginx-ingress --name nginx-ingress --set controller.publishService.enabled=true
kubectl get services -o wide -w nginx-ingress-controller

#Step 3 — Exposing the App Using an Ingress

kubectl create -f hello-kubernetes-ingress.yaml
kubectl get services

#Step 3.5 - Update DNS A Records

#Create hw1 A record to nginx-ingress-controller EXTERNAL-IP
#Create hw2 A record to nginx-ingress-controller EXTERNAL-IP

#Step 4 — Securing the Ingress Using Cert-Manager

kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm install --name cert-manager --namespace cert-manager jetstack/cert-manager
kubectl create -f production_issuer.yaml
kubectl apply -f hello-kubernetes-ingress.yaml
kubectl describe certificate letsencrypt-prod
kubectl get clusterissuer letsencrypt-prod

#Step 4.5 - Troubleshooting

# https://www.fairwinds.com/developer-hub/upgrade-cert-manager-its-worth-it
# https://github.com/jetstack/cert-manager/issues/1255
kubectl get certificates --all-namespaces
helm install stable/cert-manager -n cert-manager --namespace cert-manager
kubectl apply -f production_issuer.yaml
kubectl get clusterissuer,issuer,certificates --all-namespaces