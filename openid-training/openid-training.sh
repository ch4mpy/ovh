kubectl create namespace openid-training
kubectl create secret generic openid-training-secrets -n openid-training \
  --from-literal=mobile-front-secret=change-me \
  --from-literal=web-back-secret=gZq69wH0bkj2t_cZkRrTLHqLHXoZOhJwdhJqJ0bpCIn4ZtpsdSFQ84-RQjjMY0s2 \
  --from-literal=web-front-secret=aWy1Ayj9ZevJ6MT7XZqzb5bzZt3LpHqMokog3GodCF52tvYb8WNpnSONxjN6gxUy
kubectl apply -f openid-training.yml
kubectl apply -f ingress.yml