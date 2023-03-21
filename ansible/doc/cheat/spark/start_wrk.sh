podman  run --restart unless-stopped --name spark-wrk  --network host \
-v ${PWD}/entrypoint/:/tmp/entrypoint \
--entrypoint=/tmp/entrypoint/entrypoint_worker.sh  \
-d rahimre/apache.spark:3.2.1
