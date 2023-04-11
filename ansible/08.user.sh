#ssh node-1 useradd -g users -G application -m  -d /home/jupyterhub/s3/demo  demo
# ssh node-1 useradd -g users -G application  demo
ssh node-1 useradd -G application  -m -d /home/demo demo
#passwd demo 
