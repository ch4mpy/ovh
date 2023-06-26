kubectl create namespace demo-crs
kubectl create secret generic oauth2-clients-secrets -n demo-crs \
  --from-literal=auth0-secret=8C5IyPkOlVZ6qvY4UsUtfMiWYyMoXi8EDakM1uPXmVbD4QauvWDae40jgu_ZtZXh \
  --from-literal=cognito-secret=j1eefsa067mjtlb3vm485646eh6bh9ge8ch5shsk7hermi3o139 \
  --from-literal=keycloak-secret=GENnLQke1TNsdhyzl7fcQTEzaKyc73FA
kubectl apply -f demo/demo-crs.yml
sleep 30
kubectl get all -n demo-crs
sleep 10
kubectl apply -f demo/ingress-crs.yml