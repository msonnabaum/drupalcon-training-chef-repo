#
# Cookbook Name:: redis
# Recipe:: _server_service

redis_service = case node['platform']
when "ubuntu", "debian"
  "redis-server"
when "centos", "redhat"
  "redis"
else
  "redis"
end

service "redis" do
  service_name redis_service
  action [ :enable, :start ]
end
