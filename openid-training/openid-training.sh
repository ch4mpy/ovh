kubectl create namespace openid-training
kubectl create secret generic openid-training-secrets -n openid-training \
  --from-literal=mobile-front-secret=change-me \
  --from-literal=web-back-secret=change-me \
  --from-literal=web-front-secret=change-me
kubectl apply -f openid-training.yml
kubectl apply -f ingress.yml