```
##bootloader
docker  run -e AIRBYTE_VERSION=0.44.0 -e DATABASE_PASSWORD=postgres -e DATABASE_USER=postgres -e DATABASE_URL=jdbc:postgresql://192.168.1.4:5000/airbyte  airbyte/bootloader:0.44.0 


#temporal
docker run -it -e POSTGRES_PWD=postgres -e POSTGRES_USER=postgres \
-e DB=postgressql -e DB_PORT=5000 -e POSTGRES_SEEDS=192.168.1.4 \
-e  DYNAMIC_CONFIG_FILE_PATH=config/dynamicconfig/development.yaml \
-v ./temporal/dynamicconfig:/etc/temporal/config/dynamicconfig  \
--entrypoint /bin/bash  airbyte/temporal:0.44.0 


CREATE TABLE employee (
    emp_id 	INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1),
    birthdate DATE,
    email VARCHAR(100) UNIQUE,
    salary INT
);

INSERT INTO employee
VALUES(1,'Annie','Smith','F', DATE '1988-01-09', 'ani@email.com',5000);
```
