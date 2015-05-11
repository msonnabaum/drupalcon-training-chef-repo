Vagrant.configure("2") do |config|
  config.vm.box = "box-cutter/centos71"

  config.vm.provider :libvirt do |v,override|
    override.vm.box = "box-cutter/centos71"
    v.memory = 2048
    v.cpus = 2
    #v.disk_bus = "virtio"
    #v.volume_cache = "writeback"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "vendor/cookbooks"]
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

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.synced_folder_opts = {
      type: :nfs,
      # The nolock option can be useful for an NFSv3 client that wants to avoid the
      # NLM sideband protocol. Without this option, apt-get might hang if it tries
      # to lock files needed for /var/cache/* operations. All of this can be avoided
      # by using NFSv4 everywhere. Please note that the tcp option is not the default.
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end
end
