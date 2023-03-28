### Tutorial

https://www.youtube.com/watch?v=J0GWqfhs4ys&list=PLRTM7OTAxy3OcmFEZeIcRgyYBjFR9yNyT&index=5


####    https://gist.github.com/thomasdarimont/bb702bd1160eb200147cf1bee1c1f7ed
#### 	https://mytechnicallife.quora.com/Keycloak-how-to-work-with-admin-cli

```
## login 
/opt/keycloak/bin/kcadm.sh config credentials  --server https://keyclock.mnbvcxz.com:6443/ --realm master --user admin --password admin

export REALM=devel
/opt/keycloak/bin/kcadm.sh  create realms -s realm=$REALM -s enabled=true

/opt/keycloak/bin/kcadm.sh get  realms 
/opt/keycloak/bin/kcadm.sh delete  realms/devel
/opt/keycloak/bin/kcadm.sh get  realms/devel

/opt/keycloak/bin/kcadm.sh create clients -r $REALM  -s clientId=minio \
     -s  id=590d3a24-hf46-4ce2-9536-6d2d166d1b8d  -s enabled=true \
     -s clientAuthenticatorType=client-secret -s secret=secret \
     -s 'redirectUris=["localhost:8080"]'

/opt/keycloak/bin/kcadm.sh create users -r $REALM  -s username=demo
/opt/keycloak/bin/kcadm.sh set-password -r $REALM --username demo --new-password demo

```



### Rest Api example
```
KEYCLOAK_USER="admin"
KEYCLOAK_SECRET="admin"
KEYCLOAK_REALM="master"

#KEYCLOAK_USER="trino"
#KEYCLOAK_SECRET="trino"
#KEYCLOAK_REALM="application"

ACCESS_TOKEN=`curl -X POST --silent --show-error  -H "Content-Type: application/x-www-form-urlencoded"  -d "username=${KEYCLOAK_USER}"   -d "password=${KEYCLOAK_SECRET}"   -d "grant_type=password" -d 'client_id=admin-cli'   https://node-1:6443/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token`

ACCESS_TOKEN=`curl --silent --show-erro  -X POST  -H "Content-Type: application/x-www-form-urlencoded"  -d "username=${KEYCLOAK_USER}"   -d "password=${KEYCLOAK_SECRET}"   -d "grant_type=password" -d 'client_id=admin-cli'   https://node-1:6443/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token | jq -r '.access_token'`

trino --server https://keyclock.mnbvcxz.com:7443/  --user=''  --external-authentication 
```
