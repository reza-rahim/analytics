import requests
import json
import os

base_url='http://127.0.0.1:8088'

payload = {
   'username' : os.environ.get('SUPERSET_USER'),
   'password' : os.environ.get('SUPERSET_PASSWORD'),
   'provider' : 'db'
}

r=requests.post(base_url+'/api/v1/security/login',json=payload)
  
access_token=r.json()

headerAuth = {
  'Authorization': 'Bearer ' + access_token['access_token']
}


db_payload = {
        "database_name": "trino",
        "extra": "{\"allows_virtual_table_explore\":true,\"metadata_params\":{},\"engine_params\":{\"connect_args\":{\"verify\":false}},\"metadata_cache_timeout\":{},\"schemas_allowed_for_file_upload\":[]}",
        "impersonate_user": "true",
        "sqlalchemy_uri": "trino://"+os.environ.get('SUPERSET_USER')+":"+os.environ.get('SUPERSET_PASSWORD')+"@127.0.0.1:7443/iceberg"
}
