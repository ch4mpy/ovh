kubectl create namespace keycloak
kubectl apply -f keycloak/keycloak-postgresql-pvc.yml
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo update
helm install keycloak-db bitnami/postgresql -n keycloak --values ./keycloak/keycloak-postgresql-properties.yaml
helm install keycloak codecentric/keycloakx -n keycloak -f keycloak/keycloak-install-properties.yml
kubectl apply -f keycloak/ingress-nginx.yaml
set +H
echo "+------------------------------------------------------------------------+"
echo "|               /!\\ See comment in ingress-nginx.yaml /!\\                |"
echo "+------------------------------------------------------------------------+"
echo "| kubectl edit -n ingress-nginx deployment.apps/ingress-nginx-controller |"
echo "| to add the following to arguments:                                     |"
echo "|        - --configmap=ingress-nginx/nginx-configuration                 |"
echo "| proxy-buffer-size: \"16k\" prevents an error with Keycloak large headers |"
echo "+------------------------------------------------------------------------+"