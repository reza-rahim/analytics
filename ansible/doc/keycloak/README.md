./bin/kc.sh start-dev --https-port=6443 --https-certificate-file=/etc/cert.d/server.crt. --https-certificate-key-file=/etc/cert.d/server.key

## Welknown endpoint
https://node-1:6443//realms/master/.well-known/openid-configuration

KEYCLOAK_URL=https://node-1:6443
CURL_CMD="curl --silent --show-error"

KEYCLOAK_USER="admin"
KEYCLOAK_SECRET="admin"
KEYCLOAK_REALM="master"

KEYCLOAK_USER="trino"
KEYCLOAK_SECRET="trino"
KEYCLOAK_REALM="application"

ACCESS_TOKEN=`curl -X POST  -H "Content-Type: application/x-www-form-urlencoded"  -d "username=${KEYCLOAK_USER}"   -d "password=${KEYCLOAK_SECRET}"   -d "grant_type=password" -d 'client_id=admin-cli'   https://node-1:6443/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token`


ACCESS_TOKEN=`curl --silent --show-erro  -X POST  -H "Content-Type: application/x-www-form-urlencoded"  -d "username=${KEYCLOAK_USER}"   -d "password=${KEYCLOAK_SECRET}"   -d "grant_type=password" -d 'client_id=admin-cli'   https://node-1:6443/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token | jq -r '.access_token'`


trino --server https://keyclock.mnbvcxz.com:7443/  --user=''  --external-authentication 

