#!/bin/bash

/opt/spark/sbin/start-worker.sh spark://spark:7077 ; 


while true
do
   echo Keep running
   sleep 3600
 done
