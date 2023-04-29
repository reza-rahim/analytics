from supersetapiclient.client import SupersetClient
from supersetapiclient.databases import Database
import os
os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'

client = SupersetClient( host="http://0.0.0.0:8088", username="demo",password="demo" )
#dashboards = client.dashboards.find()
db=Database()
