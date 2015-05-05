#
# Cookbook Name:: redis
# Recipe:: _server_init

template "redis_init" do
  path "/etc/init.d/redis-server"
  source "redis_init.erb"
  owner "root"
  group "root"
  mode 0755
end

include_recipe "redis::_server_service"
