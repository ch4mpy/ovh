helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set replicas=1 \
  --set rbac.create=true \
  --set prometheus.enabled=false \
  --set installCRDs=true \
  --set webhook.timeoutSeconds=30

kubectl apply -f lets-encrypt-issuer.yml

export INGRESS_URL=$(kubectl get svc -n ingress-nginx ingress-nginx-controller -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
set +H
echo "+----------------------------------------+"
echo "|      /!\\ Update DNS A records /!\\      |"
echo "+----------------------------------------+"
echo "The cluster public IP is $INGRESS_URL"