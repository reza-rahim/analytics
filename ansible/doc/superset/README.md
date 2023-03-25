podman run --restart unless-stopped -d --network host -v /opt/superset/pythonpath:/^Cp/pythonpath --name superset docker.io/apache/superset

podman exec -it superset superset fab create-admin \
               --username demo \
               --firstname Superset \
               --lastname Admin \
               --email demo@superset.com \
               --password demo

podman  exec -it superset superset db upgrade
podman exec -it superset superset init
podman exec -u root -it superset  bash -c 'pip install  sqlalchemy-trino'
#  podman  exec -it superset  bash


#  podman kill superset ;  podman rm  superset;
