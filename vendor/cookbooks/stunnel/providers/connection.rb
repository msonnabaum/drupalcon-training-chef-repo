def load_current_resource
  node[:stunnel][:services] ||= {}
  unless(new_resource.service_name)
    new_resource.service_name new_resource.name
  end
end

action :create do
  hsh = Mash.new(
    :connect => new_resource.connect,
    :accept => new_resource.accept,
    :timeout_close => new_resource.timeout_close
  )
  exist = Mash.new(node[:stunnel][:services][new_resource.service_name])
  if(exist != hsh)
    node.set[:stunnel][:services][new_resource.service_name] = hsh
    new_resource.updated_by_last_action(true)
  end
end

action :delete do
  serv_data = Mash.new(node[:stunnel][:services])
  if(serv_data.delete(new_resource.service_name))
    node.set[:stunnel][:services] = serv_data
    new_resource.updated_by_last_action(true)
  end
end
