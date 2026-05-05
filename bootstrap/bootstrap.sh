# ArgoCD 설치
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

kubectl create ns argocd

helm upgrade -i argocd argo/argo-cd \
  --namespace argocd \
  -f values-argocd.yaml \
  --version 9.4.17

# sealed-secrets 키 설치
kubectl apply -f ../sealed-secrets-master-key.yaml

# App of Apps 설치
kubectl apply -f ../app-of-apps.yaml