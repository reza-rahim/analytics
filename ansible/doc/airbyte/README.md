##bootloader
docker  run -e AIRBYTE_VERSION=0.44.0 -e DATABASE_PASSWORD=postgres -e DATABASE_USER=postgres -e DATABASE_URL=jdbc:postgresql://192.168.1.4:5000/airbyte  airbyte/bootloader:0.44.0 


#temporal
docker run -it -e POSTGRES_PWD=postgres -e POSTGRES_USER=postgres \
-e DB=postgressql -e DB_PORT=5000 -e POSTGRES_SEEDS=192.168.1.4 \
-e  DYNAMIC_CONFIG_FILE_PATH=config/dynamicconfig/development.yaml \
-v ./temporal/dynamicconfig:/etc/temporal/config/dynamicconfig  \
--entrypoint /bin/bash  airbyte/temporal:0.44.0 
