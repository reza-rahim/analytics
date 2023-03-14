podman run --restart unless-stopped --name spark-master  --network host  \
-v ${PWD}/entrypoint/:/tmp/entrypoint \
--entrypoint=/tmp/entrypoint/entrypoint_master.sh  \
-d docker.io/rahimre/apache.spark:3.2.1
