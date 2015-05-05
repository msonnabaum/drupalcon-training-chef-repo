#
# Cookbook Name:: cookbooks/drupal
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

cookbook_file "drupal" do
  path "/etc/httpd/sites-available/drupal"
end

apache_site "drupal" do
  enabled true
end

# LOLredis
package "php-pecl-redis" do
  action :install
end
