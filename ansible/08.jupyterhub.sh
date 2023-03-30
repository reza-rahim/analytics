ansible-playbook -i inventory.ini \
-e keycloak_jupyter_client_id=$KEYCLOAK_JUPYTER_CLIENT_ID \
-e keycloak_jupyter_client_secret=$KEYCLOAK_JUPYTER_CLIENT_SECRET \
jupyterhub.yaml
