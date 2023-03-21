podman run  --restart unless-stopped --network=host --name=hive \
-v ${PWD}/conf:/opt/hive-metastore/conf/ \
-v ${PWD}/entrypoint:/root/entrypoint \
--entrypoint=/root/entrypoint/entrypoint.sh \
-d rahimre/hive.meta.standalone:1.0
