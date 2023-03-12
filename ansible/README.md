
systemctl --host minio-node-1 stop minio; systemctl --host minio-node-2 stop minio; systemctl --host minio-node-3 stop minio;systemctl --host minio-node-4 stop minio;

ssh minio-node-1  umount /dev/sdb /dev/sdc /dev/sdd /dev/sde;  ssh minio-node-2  umount /dev/sdb /dev/sdc /dev/sdd /dev/sde; ssh minio-node-3  umount /dev/sdb /dev/sdc /dev/sdd /dev/sde; ssh minio-node-4  umount /dev/sdb /dev/sdc /dev/sdd /dev/sde;


systemctl --host minio-node-1 start minio; systemctl --host minio-node-2 start minio; systemctl --host minio-node-3 start minio;systemctl --host minio-node-4 start minio;

journalctl -f -u minio.service


ssh minio-node-2 -L 9001:localhost:9001


curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key" | sudo apt-key add -

Conda

https://gist.github.com/aksakalli/72d54b22ce4da2ee81eb1a58cbc67a0c


conda install -c conda-forge jupyterhub -y
conda install notebook -y
jupyterhub --generate-config


---

## keyclocl

https://cloudinfrastructureservices.co.uk/install-keycloak-sso-on-ubuntu-20-04/

##Dowanload keyclock
apt-get install default-jdk -y
wget https://github.com/keycloak/keycloak/releases/download/21.0.1/keycloak-21.0.1.tar.gz
tar -xvzf keycloak-15.0.2.tar.gz

mv keycloak-21.0.1 /opt/keycloak/

#user
groupadd keycloak
useradd -r -g keycloak -d /opt/keycloak -s /sbin/nologin keycloak

chown -R keycloak: /opt/keycloak
chmod o+x /opt/keycloak/bin/

to start the keyclock server
/opt/keycloak/bin/kc.sh start-dev


https://medium.com/keycloak/secure-jupyterlab-using-keycloak-56e60c369c5f



