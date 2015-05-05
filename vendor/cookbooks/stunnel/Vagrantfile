# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

$install_docker = <<DOCKER
apt-get update -y
apt-get install linux-image-extra-`uname -r` -y

# Add the Docker repository key to your local keychain
wget -qO- https://get.docker.io/gpg | apt-key add -

# Add the Docker repository to your apt sources list.
echo "deb http://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list

# update
apt-get update -y
echo -e "DOCKER_OPTS='-H unix:///var/run/docker.sock -H tcp://0.0.0.0:4242'\nulimit -n 65535" > /etc/default/docker

# install
apt-get install lxc-docker -y

perl -p -i -e 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/' /etc/default/ufw

ufw disable
DOCKER

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #config.vm.provision :shell, :inline => $install_chef
  config.vm.define "docker" do |docker|
    docker.vm.box = "opscode-ubuntu-13.04"
    docker.vm.provider :vmware_fusion do |v, override|
      override.vm.box = "bento-ubuntu-13.04"
      override.vm.box_url = "https://s3.amazonaws.com/hw-vagrant/bento-ubuntu-13.04_vmware_201308231111.box"
    end
    docker.vm.provision :shell, :inline => $install_docker
    docker.vm.network "private_network", :ip => "192.168.42.42"
  end

end
