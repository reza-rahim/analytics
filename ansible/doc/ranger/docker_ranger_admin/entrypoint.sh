#!/bin/bash
tar xvf ranger-2.3.0-admin.tar.gz 
yes | cp  install.properties ranger-2.3.0-admin/
 
cd ranger-2.3.0-admin
./setup.sh 
ranger-admin start

sleep infinity

