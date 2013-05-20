#
# Cookbook Name:: cookbooks/drupal
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

cookbook_file "drupal" do
  path "/etc/apache2/sites-available/drupal"
end

execute "a2ensite drupal" do
  creates "/etc/apache2/sites-enabled/drupal"
  notifies :restart, "service[apache2]"
end

