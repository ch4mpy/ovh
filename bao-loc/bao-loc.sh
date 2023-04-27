kubectl create namespace demo-bao-loc
kubectl create secret generic bao-loc-secrets -n demo-bao-loc --from-literal=db-password=change-me --from-literal=oauth2-client-secret=change-me
kubectl apply -f bao-loc.yml