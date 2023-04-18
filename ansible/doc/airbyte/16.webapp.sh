docker run  \
-e AIRBYTE_VERSION=0.44.0 \
-e API_URL=/api/v1/ \
-e CONNECTOR_BUILDER_API_URL=/connector-builder-api \
-e INTERNAL_API_HOST=airbyte-server:8001 \
-e CONNECTOR_BUILDER_API_HOST=airbyte-connector-builder-server:80 \
-e TRACKING_STRATEGY=segment \
--net airbyte \
--ip=172.36.0.13 \
--name airbyte-webapp \
--rm \
-d \
airbyte/webapp:0.44.0 
