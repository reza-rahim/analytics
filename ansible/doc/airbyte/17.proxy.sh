docker run  \
-e BASIC_AUTH_USERNAME=demo \
-e BASIC_AUTH_PASSWORD=demo \
-e BASIC_AUTH_PROXY_TIMEOUT=600 \
--net airbyte \
--ip=172.36.0.16 \
--name airbyte-proxy \
-p 8000:8000 \
-p 8001:8001 \
-p 8003:8003 \
-d \
--rm \
airbyte/proxy:0.44.0 
