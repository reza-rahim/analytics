from oauthenticator.generic import GenericOAuthenticator

c = get_config()  #noqa
c.JupyterHub.authenticator_class = GenericOAuthenticator

c.GenericOAuthenticator.client_id = 'jy'
c.GenericOAuthenticator.client_secret='4BogQM5E95LRw6a86hZsZQYPOuGXCKhk'
c.GenericOAuthenticator.token_url = 'http://localhost:8080/realms/demo/protocol/openid-connect/token'
c.GenericOAuthenticator.userdata_url = 'http://localhost:8080/realms/demo/protocol/openid-connect/userinfo'
c.GenericOAuthenticator.userdata_params = {'state': 'state'}
c.GenericOAuthenticator.username_key = 'preferred_username'
c.GenericOAuthenticator.login_service = 'Keycloak'
c.GenericOAuthenticator.scope = ['openid', 'profile']

c.JupyterHub.spawner_class = 'jupyterhub.spawner.SimpleLocalProcessSpawner'


