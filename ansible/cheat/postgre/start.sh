podman run -e POSTGRES_USER=demo \
-e POSTGRES_PASSWORD=demo1234 \
-e PGDATA=/data/postgres \
-v ${PWD}/init/:/docker-entrypoint-initdb.d/ \
-v /opt/data/postgres:/data/postgres \
--network=host -d  --name postgres \
--restart unless-stopped \
postgres
