package "redis-server"

service "redis-server" do
  action :enable
end

template "/etc/redis/redis.conf" do
  notifies :restart, resources(:service => "redis-server")
end

service "redis-server" do
  action :start
end
