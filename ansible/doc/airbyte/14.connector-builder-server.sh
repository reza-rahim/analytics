docker run  \
-e AIRBYTE_VERSION=0.44.0 \
--net airbyte \
--ip=172.36.0.15 \
--name airbyte-connector-builder-server \
--rm \
-d \
airbyte/connector-builder-server:0.44.0 
