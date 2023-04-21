# Init OVH Managed K8s Cluster
Secrets need an edit. search for `change-me` in files and replace with secrets of your own.

Email in lets-encrypt-issuer.yml might be edited.

When deploying to another domain than `c4-soft.com`, `ingress-nginx.yaml`, `bff-ingress.yaml` and `demo-bff.yaml` must be edited to point to the other domain.