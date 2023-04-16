#ssh node-1 useradd -g users -G application -m  -d /home/jupyterhub/s3/demo  demo
# ssh node-1 useradd -g users -G application  demo
ssh node-1 useradd -G fuse,jceks  -m -d /home/demo -s /bin/bash demo
#passwd demo 
