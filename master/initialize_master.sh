#!/bin/sh

# Common initialization
echo "Doing common initialization ...."
. /vagrant_data/initialize.sh

# Starting the master
echo "Starting the master"
kubeadm init 

# Installing network pod
echo "Installing the network pod ..."
kubectl create -f https://git.io/weave-kube

# Checking for installed network pod
echo "Checking for the installed network pod.."
while :
do
	export checkingnet=$(kubectl get pods --all-namespaces|grep kube-dns)
	if [[ $checkingnet == *"Running"* ]]
	then
	  echo "Network pod is running";
	  break;
	fi
   sleep 5
done

cat /vagrant_data/master.log|grep token|awk '{print $5}'| sed 's/"//g'>/vagrant_data/token

