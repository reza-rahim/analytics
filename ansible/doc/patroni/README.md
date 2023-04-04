apt update;

apt install python3-pip python3-dev libpq-devuo
apt install postgresql;
 
pip install psycopg2-binary;     pip3 install patroni[zookeeper]; 

https://arctype.com/blog/postgres-patroni/

/usr/local/bin/patroni  /opt/patroni/patroni.yaml

patronictl  -c /opt/patroni/patroni.yaml list

/opt/zookeeper/bin/zkCli.sh

