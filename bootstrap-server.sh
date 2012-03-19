#!/bin/bash

echo "Update information about available packages."

apt-get update

echo "Installing Ruby and Ruby Gems through apt-get."

# Install ruby and the ruby gems system through Ubuntu's package manager
# (apt-get.)
apt-get -y install rubygems
# Fetch new information about gems that are available to install.
gem update
# Install the JSON gem (bug in Chef, sorry.)
gem install json
# Install the Chef gem.
gem install chef

echo "Installing the Git version control system through apt-get."

# Install the Git version control system using Ubuntu's package manager.
apt-get -y install git-core

echo "You're ready to rock and roll."

