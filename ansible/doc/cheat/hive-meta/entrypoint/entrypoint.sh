#!/bin/bash

/opt/apache-hive-metastore-3.0.0-bin/bin/schematool -initSchema -dbType postgres

/opt/apache-hive-metastore-3.0.0-bin/bin/start-metastore


