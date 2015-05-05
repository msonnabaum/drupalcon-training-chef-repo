user node['redis']['user'] do
  gid node['redis']['group']
end
