#!/bin/bash

yum update -y
yum install -y epel-release
yum install -y htop vim net-tools
yum install -y docker-latest
systemctl enable docker-latest && systemctl start docker-latest


# Install kubernetes
# ##################

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

setenforce 0

yum install -y kubelet kubeadm
systemctl enable kubelet && systemctl start kubelet
