Bootstrap: docker
From: twongjirad/docker-ubuntu16.04-root:6.12.04_cuda8.0

%post
  apt-get update -y
  apt-get install -y voms-clients krb5-user jacksum emacs vim
  cp /tmp/krb5.conf /etc/
  cp -r /tmp/grid-security/* /etc/grid-security/
  cp /tmp/vomses /etc/  
  mkdir -p /cluster/home
  mkdir -p /cluster/kappa
  mkdir -p /cluster/shared
  mkdir -p /opt/shared

%environment
