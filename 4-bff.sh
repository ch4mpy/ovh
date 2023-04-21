kubectl create namespace demo-bff
kubectl create secret generic bff-clients-secrets -n demo-bff --from-literal=change-me --from-literal=cognito-secret=change-me --from-literal=keycloak-secret=change-me
kubectl apply -f bff/demo-bff.yaml
sleep 30
kubectl get all -n demo-bff
sleep 10
kubectl apply -f bff/bff-ingress.yaml