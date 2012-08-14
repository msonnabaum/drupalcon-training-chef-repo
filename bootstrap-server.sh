#!/bin/bash

echo "Update information about available packages."

apt-get update

echo "Installing Chef."

curl -L http://www.opscode.com/chef/install.sh | sudo bash

echo "Installing the Git version control system through apt-get."

# Install the Git version control system using Ubuntu's package manager.
apt-get -y install git-core

echo "You're ready to rock and roll."

