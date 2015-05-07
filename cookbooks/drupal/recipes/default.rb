#
# Cookbook Name:: drupal
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

cookbook_file "drupal" do
  path "/etc/httpd/sites-available/drupal.conf"
  notifies :restart, 'service[apache2]'
end

apache_site "drupal" do
  enabled true
end

# Clean up /var/www for our use.
%w{cgi-bin html}.each do |dir|
  directory "/var/www/#{dir}" do
    recursive true
    action :delete
  end
end

# Add a few more needed PHP packages.
%w{pecl-redis mbstring pecl-zendopcache}.each do |mod|
  package "php-#{mod}" do
    action :install
    notifies :restart, 'service[php-fpm]'
  end
end
