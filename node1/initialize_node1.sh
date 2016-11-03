#!/bin/bash

# Common initialization
echo "Doing common initialization ...."
. /vagrant_data/initialize.sh

echo "KUBERNETES_MASTER_IP ${KUBERNETES_MASTER_IP}"

# Takent the token
echo "KUBERNETES_MASTER_TOKEN ${KUBERNETES_MASTER_TOKEN}"

# Joinig the node to the master
echo "Joinig the node to the master..."
kubeadm join --token $KUBERNETES_MASTER_TOKEN $KUBERNETES_MASTER_IP
