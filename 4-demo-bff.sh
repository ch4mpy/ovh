kubectl create namespace demo-bff
kubectl create secret generic oauth2-clients-secrets -n demo-bff \
  --from-literal=auth0-secret=8C5IyPkOlVZ6qvY4UsUtfMiWYyMoXi8EDakM1uPXmVbD4QauvWDae40jgu_ZtZXh \
  --from-literal=cognito-secret=j1eefsa067mjtlb3vm485646eh6bh9ge8ch5shsk7hermi3o139 \
  --from-literal=keycloak-secret=GENnLQke1TNsdhyzl7fcQTEzaKyc73FA
kubectl apply -f demo/demo-bff.yml
sleep 30
kubectl get all -n demo-bff
sleep 10
kubectl apply -f demo/ingress-bff.yml