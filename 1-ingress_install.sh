helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install \
  ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace

kubectl apply -f ingres-nginx-config.yml

helm upgrade -i ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx