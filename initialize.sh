#!/bin/bash

# Adding kubernetes report
sudo cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://yum.kubernetes.io/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

sudo setenforce 0
sudo yum install -y apache2 git
sudo yum install -y docker kubelet kubeadm kubectl kubernetes-cni
sudo systemctl enable docker && systemctl start docker
sudo systemctl enable kubelet && systemctl start kubelet

# Setting root password
sudo /usr/bin/passwd root <<EOF
testtest
testtest
EOF

# Enable SSH server
echo "Enabling SSH daemon"
service sshd start
chk sshd on
echo "SSHD enabled"

# Setting keyboard layout
echo "Setting keymap laoyut to es"
localectl set-keymap es
