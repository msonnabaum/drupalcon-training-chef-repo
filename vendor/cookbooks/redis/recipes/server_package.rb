#
# Cookbook Name:: redis
# Recipe:: _server_install_from_package

case node.platform_family
when "debian"
  pkg = "redis-server"
when "rhel", "fedora"
  include_recipe "yum::epel"
  pkg = "redis"
else
  pkg = "redis"
end

package "redis" do
  package_name pkg
  action :install
end
