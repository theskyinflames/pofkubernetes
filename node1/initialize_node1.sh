#!/bin/bash

# Common initialization
echo "Doing common initialization ...."
. /vagrant_data/initialize.sh

# Joinig the node to the master
echo "Joinig the node to the master..."
kubeadm join --token $KUBERNETES_MASTER_TOKEN 192.168.33.10
