# A POF of Kubernetes/Vagrant on progress ....

Implementation of the getting started guide published at [kubeadm](http://kubernetes.io/docs/getting-started-guides/kubeadm/) for [CentOS 7](https://www.centos.org/) using [Virtualbox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/).

## Dependencies
* Vagrant version >= 1.8.1
* Virtualbox version >= 5.1.8
## Checking for Etcd is running
Log into master as root and do:
```sh
curl -fs -X PUT "http://${host}:${port}/v2/keys/_test"
```
