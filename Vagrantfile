Vagrant.configure("2") do |config|
  config.vm.box = "chef/ubuntu-12.04"

  config.vm.provider :libvirt do |v,override|
    override.vm.box = "boxcutter/ubuntu1204"
    v.memory = 2048
    v.cpus = 2
    v.disk_bus = "virtio"
    v.volume_cache = "writeback"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "vendor/cookbooks"
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"
    chef.add_role("web-server")
    chef.add_role("proxy-cache")
    chef.json.merge!({
      :mysql => {
        :server_root_password => ""
      }
    })
    chef.synced_folder_type = "rsync"
  end

  # Run the host with a host-only IP of 172.22.22.22.
  config.vm.network :private_network, ip: "172.22.22.22"

  config.ssh.forward_agent = true
end
