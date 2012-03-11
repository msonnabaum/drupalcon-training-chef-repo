include_recipe "build-essential"

version = node['php']['version']

bash "build php" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  git clone https://github.com/nicolasff/phpredis.git
  (cd phpredis && phpize && ./configure)
  (cd phpredis && make && make install)
  EOF
  not_if "php -m | grep redis"
end

template "#{node['php']['conf_dir']}/conf.d/redis.ini" do
  source "redis.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end
