### Tutorial

https://www.youtube.com/watch?v=J0GWqfhs4ys&list=PLRTM7OTAxy3OcmFEZeIcRgyYBjFR9yNyT&index=5


####    https://gist.github.com/thomasdarimont/bb702bd1160eb200147cf1bee1c1f7ed
#### 	https://mytechnicallife.quora.com/Keycloak-how-to-work-with-admin-cli

```
## https://keyclock.mnbvcxz.com:6443/realms/devel/.well-known/openid-configuration


## login 
/opt/keycloak/bin/kcadm.sh config credentials --server https://keyclock.mnbvcxz.com:6443/ --realm master --user admin --password admin

export REALM=devel
/opt/keycloak/bin/kcadm.sh  create realms -s realm=$REALM -s enabled=true

/opt/keycloak/bin/kcadm.sh get realms 
/opt/keycloak/bin/kcadm.sh delete realms/devel
/opt/keycloak/bin/kcadm.sh get realms/devel

/opt/keycloak/bin/kcadm.sh create clients -r $REALM  -s clientId=trino \
     -s  id=098bbefa-98c3-43fc-a4a7-f3b4322ef725  -s enabled=true \
     -s clientAuthenticatorType=client-secret -s secret=55c5b0fa-a8a4-401c-932f-4a6d2eb572ef \
     -s 'redirectUris=["https://trino.mnbvcxz.com:7443/oauth2/callback"]'

/opt/keycloak/bin/kcadm.sh create users -r $REALM  -s username=demo -s enabled=true
/opt/keycloak/bin/kcadm.sh set-password -r $REALM --username demo --new-password demo


 /opt/keycloak/bin/kcadm.sh get -r bi clients


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
