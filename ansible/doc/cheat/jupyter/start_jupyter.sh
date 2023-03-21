export OAUTH2_AUTHORIZE_URL=http://ost:8080/realms/demo/protocol/openid-connect/auth
export OAUTH2_TOKEN_URL=http://localhost:8080/realms/demo/protocol/openid-connect/token

jupyterhub -f ./jupyterhub_config.py

