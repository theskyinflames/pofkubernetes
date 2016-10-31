#!/bin/bash

# Starting the master
cd ./master
cat vagrant up --provider=virtualbox > ../master.log

# Generate token variable
cd ..
export KUBERNETES_MASTER_TOKEN=$(master.log|grep "generated token"|awk '{print $6}'|sed 's/"//g')

# Add the node 1
cd ./node1
vagrant up --provider=virtualbox



