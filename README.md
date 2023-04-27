# Init OVH Managed K8s Cluster
Secrets need an edit. search for `change-me` in files and replace with secrets of your own.

Email in lets-encrypt-issuer.yml might be edited.

When deploying to another domain than `c4-soft.com`, `ingress-nginx.yml`, `bff-ingress.yml` and `demo-bff.yml` must be edited to point to the other domain.

## Docker Desktop Networking Trick on Windows
`Get-NetIPInterface -AddressFamily IPv4 | Sort-Object -Property InterfaceMetric -Descending`
`Set-NetIPInterface -InterfaceAlias 'Ethernet' -InterfaceMetric 1`
`Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -InterfaceMetric 2`