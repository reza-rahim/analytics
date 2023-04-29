import requests
import json

base_url='http://127.0.0.1:8088'

payload = {
   'username' : 'trino',
   'password' : 'trino',
   'provider' : 'db'
}

r=requests.post(base_url+'/api/v1/security/login',json=payload)

access_token=r.json()

headerAuth = {
  'Authorization': 'Bearer ' + access_token['access_token']
}

#r2=requests.get(base_url + '/api/v1/chart', headers = headerAuth)
#r3=requests.get(base_url + '/api/v1/dashboarde, headers = headerAuth)
r4=requests.get(base_url + '/api/v1/database', headers = headerAuth)
pretty = json.dumps(r4.json(), indent=4)
print(pretty)


db_payload = {
        "database_name": "trino6",
        "extra": "{\"allows_virtual_table_explore\":true,\"metadata_params\":{},\"engine_params\":{\"connect_args\":{\"verify\":false}},\"metadata_cache_timeout\":{},\"schemas_allowed_for_file_upload\":[]}",
        "impersonate_user": "true",
        "sqlalchemy_uri": "trino://trino:trino@127.0.0.1:7443/iceberg?verify=false"
}

db_payload = {
        "database_name": "PostgreSQL1",
        "sqlalchemy_uri": "postgresql+psycopg2://postgres:postgres@127.0.0.1:5000/airflow"
        }        

r5=requests.post(base_url + '/api/v1/database',headers = headerAuth, json=db_payload)
r5.json()

