#!/bin/bash

echo "Update information about available packages."

apt-get update

echo "Installing Ruby and Ruby Gems through apt-get."

# Install ruby and the ruby gems system through Ubuntu's package manager
# (apt-get.)
apt-get -y install rubygems
# Ensure that the installed versions of all gems are up to date.
gem update --system
# Install the Chef gem.
gem install chef

echo "Installing Ruby and Ruby Gems through apt-get."

# Install the Git version control system using Ubuntu's package manager.
apt-get -y install git-core

echo "You're ready to rock and roll."

