
### postgresql HA
https://www.postgresql.fastware.com/postgresql-insider-ha-pgpool-ii

https://buildmedia.readthedocs.org/media/pdf/patroni/latest/patroni.pdf


##Create sample data 

wget https://github.com/reza-rahim/ai_data/raw/main/adventurework/data.zip

wget https://raw.githubusercontent.com/morenoh149/postgresDBSamples/master/adventureworks/install.sql


```
unzip data.zip -d data # this will unzip the data into the directory 'data'
export PGPASSWORD=postgres
psql -h localhost -p 5000 -U postgres -c "CREATE DATABASE \"Adventureworks\";"
psql -h localhost -p 5000 -U postgres -d Adventureworks < install.sql
```
To see the data`


```	
\c "Adventureworks"
\dt (humanresources|person|production|purchasing|sales).*
```
