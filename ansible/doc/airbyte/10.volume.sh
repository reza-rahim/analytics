docker network create --subnet=172.36.0.0/16 airbyte
docker volume create airbyte_data 
docker volume create airbyte_workspace

docker  run -e AIRBYTE_VERSION=0.44.0 \
-e DATABASE_PASSWORD=postgres \
-e DATABASE_USER=postgres \
-e DATABASE_URL=jdbc:postgresql://192.168.1.4:5000/airbyte  \
airbyte/bootloader:0.44.0
