

#### https://gist.github.com/thomasdarimont/bb702bd1160eb200147cf1bee1c1f7ed
## 	https://mytechnicallife.quora.com/Keycloak-how-to-work-with-admin-cli

```
login in
/opt/keycloak/bin/kcadm.sh config credentials  --server https://keyclock.mnbvcxz.com:6443/ --realm master --user admin --password admin


KC_REALM=

```






### REST API 
KEYCLOAK_URL=https://keyclock.mnbvcxz.com:6443/
#CURL_CMD="curl --silent --show-error"

KEYCLOAK_USER="admin"
KEYCLOAK_SECRET="admin"
KEYCLOAK_REALM="master"

#KEYCLOAK_USER="trino"
#KEYCLOAK_SECRET="trino"
#KEYCLOAK_REALM="application"

ACCESS_TOKEN=`curl -X POST --silent --show-error  -H "Content-Type: application/x-www-form-urlencoded"  -d "username=${KEYCLOAK_USER}"   -d "password=${KEYCLOAK_SECRET}"   -d "grant_type=password" -d 'client_id=admin-cli'   https://node-1:6443/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token`

ACCESS_TOKEN=`curl --silent --show-erro  -X POST  -H "Content-Type: application/x-www-form-urlencoded"  -d "username=${KEYCLOAK_USER}"   -d "password=${KEYCLOAK_SECRET}"   -d "grant_type=password" -d 'client_id=admin-cli'   https://node-1:6443/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token | jq -r '.access_token'`

trino --server https://keyclock.mnbvcxz.com:7443/  --user=''  --external-authentication 

