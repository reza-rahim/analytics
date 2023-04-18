mkdir -p /tmp/workspace;
chmod 777 /tmp/workspace;
docker run  \
-e AIRBYTE_VERSION=0.44.0 \
-e CONFIGS_DATABASE_MINIMUM_FLYWAY_MIGRATION_VERSION=0.40.23.002 \
-e DATABASE_PASSWORD=postgres \
-e DATABASE_URL=jdbc:postgresql://192.168.1.6:5000/airbyte \
-e DATABASE_USER=postgres \
-e LOG_LEVEL=INFO \
-e TEMPORAL_HISTORY_RETENTION_IN_DAYS=7 \
-e WORKSPACE_ROOT=/tmp/workspace \
-e MICRONAUT_ENVIRONMENTS=control-plane \
-e TEMPORAL_HOST=airbyte-temporal:7233 \
-v /tmp/workspace:/tmp/workspace \
--net airbyte \
--ip=172.36.0.14 \
--name airbyte-cron \
--rm \
-d \
airbyte/cron:0.44.0 /app/airbyte-cron-0.44.0/bin/airbyte-cron
