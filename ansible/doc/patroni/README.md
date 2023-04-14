
## https://readthedocs.org/projects/patroni-test/downloads/pdf/docs-readthedocs/

#### how to delete patroni

```
# on all patroni node
systemctl stop patroni 
rm -rf /var/data/patroni/*

#on zk
echo deleteall /db / |/opt/zookeeper/bin/zkCli.sh  
```

####

https://arctype.com/blog/postgres-patroni/

##benchmark
https://severalnines.com/blog/benchmarking-postgresql-performance/
```
pgbench  -h localhost -p 5000 -U postgres
```

## cheat
https://github.com/TantorLabs/pg_cluster
https://bootvar.com/useful-patroni-commands/

```
patronictl  -c /opt/patroni/patroni.yaml list
patronictl -c /etc/patroni/patroni.yaml reload 
patronictl -c /etc/patroni/patroni.yaml switchover
patronictl -c /etc/patroni/patroni.yaml pause
patronictl -c /etc/patroni/patroni.yaml resume

# Restart particular node in cluster
patronictl -c /etc/patroni/patroni.yaml restart <CLUSTER_NAME> <NODE_NAME>

# Restart whole cluster(all nodes in cluster)
patronictl -c /etc/patroni/patroni.yaml restart <CLUSTER_NAME>

##
patronictl -c /etc/patroni/patroni.yaml reinit <CLUSTER_NAME> <NODE_NAME>
patronictl -c /etc/patroni/NODE_2.yml reinit --force main NODE_2


alias patronictl='patronictl -c /etc/patroni/patroni.yaml'

```
