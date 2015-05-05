name "redis"
maintainer       "Miah Johnson"
maintainer_email "miah@cx.com"
license          "Apache 2.0"
description      "Installs/configures redis"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.4"

recipe "redis::_group", "Creates a group for Redis."
recipe "redis::_server_config", "Creates configuration directories and installs templatized redis.conf."
recipe "redis::_server_init", "Installs a templatized redis sysv initscript."
recipe "redis::_server_install_from_package", "Installs Redis through the chef package resource."
recipe "redis::_server_install_from_package", "Downloads, compiles, and installs Redis from source."
recipe "redis::_server_runit", "Installs templatized redis runit configuration."
recipe "redis::_server_service", "Configures Redis through the chef service resource."
recipe "redis::_user", "Creates a user for Redis."
recipe "redis::default", "The default recipe executes the redis::server_package recipe."
recipe "redis::server", "The default recipe executes the redis::server_package recipe. This recipe is here for compatibility with other community Redis cookbooks."
recipe "redis::server_package", "Uses the recipe crumbs in the Redis cookbook to manage a packaged Redis instance."
recipe "redis::server_source", "Uses the recipe crumbs in the Redis cookbook to manage a source compiled Redis instance."

%w[ ubuntu centos ].each do |os|
  supports os
end

%w[ build-essential runit ].each do |cookbook|
  depends cookbook
end
