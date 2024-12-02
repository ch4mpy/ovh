helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
kubectl create namespace quiz
kubectl apply -f quiz/postgresql-pvc.yml
helm install quiz-db oci://registry-1.docker.io/bitnamicharts/postgresql -n quiz --values ./quiz/postgresql-properties.yml
kubectl create secret generic quiz-secrets -n quiz \
  --from-literal=spring.datasource.password=change-me \
  --from-literal=spring.security.oauth2.client.registration.quiz-admin.client-secret=change-me \
  --from-literal=spring.security.oauth2.client.registration.quiz-bff.client-secret=change-me \
  --from-literal=spring.mail.password=change-me
kubectl apply -f quiz/quiz.yml
sleep 30
kubectl get all -n quiz
sleep 10
kubectl apply -f quiz/ingress.yml