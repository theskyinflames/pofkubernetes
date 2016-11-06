#!/bin/bash
export KUBERNETES_MASTER_IP=192.168.33.10
export KUBERNETES_MASTER_TOKEN=cac195.95cea9f0d7478e7d
echo "KUBERNETES_MASTER_IP ${KUBERNETES_MASTER_IP}"
echo "KUBERNETES_MASTER_TOKEN ${KUBERNETES_MASTER_TOKEN}"

# Common initialization
echo "Doing common initialization ...."
. /vagrant_data/initialize.sh

# Joinig the node to the master
echo "Joinig the node to the master..."
kubeadm join --skip-preflight-checks --token=$KUBERNETES_MASTER_TOKEN $KUBERNETES_MASTER_IP
