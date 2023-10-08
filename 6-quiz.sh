helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
kubectl create namespace quiz
kubectl apply -f quiz/postgresql-pvc.yml
helm install quiz-db oci://registry-1.docker.io/bitnamicharts/postgresql -n quiz --values ./quiz/postgresql-properties.yml
kubectl create secret generic quiz-secrets -n quiz \
  --from-literal=spring.datasource.password=qsdjfhMLioidihfOHUHCVP654 \
  --from-literal=spring.security.oauth2.client.registration.quiz-admin.client-secret=CvRTf47znRMwzw3dwFTbR5BujShnsmvV \
  --from-literal=spring.security.oauth2.client.registration.quiz-bff.client-secret=LzwMWfyKN8dpYU5RM39wnnxo4b3ozzAg \
  --from-literal=spring.mail.password=gwjvwowktcbisgnz
kubectl apply -f quiz/quiz.yml
sleep 30
kubectl get all -n quiz
sleep 10
kubectl apply -f quiz/ingress.yml