## temporal
docker run  \
-e POSTGRES_PWD=postgres \
-e POSTGRES_USER=postgres \
-e DB=postgressql \
-e DB_PORT=5000 \
-e POSTGRES_SEEDS=192.168.1.4  \
-e DYNAMIC_CONFIG_FILE_PATH=config/dynamicconfig/development.yaml  \
-v ./temporal/dynamicconfig:/etc/temporal/config/dynamicconfig  \
-v ./temporal/docker.yaml:/etc/temporal/config/docker.yaml  \
--net airbyte \
--ip=172.36.0.10 \
-d \
--name temporal \
airbyte/temporal:0.44.0  temporal-server --env docker start
