#
# Cookbook Name:: redis
# Recipe:: _server_install_from_package

case node.platform
when "debian", "ubuntu"
  pkg = "redis-server"
else
  pkg = "redis"
end

package "redis" do
  package_name pkg
  action :install
end
