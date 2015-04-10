Vagrant.configure("2") do |config|
  config.vm.box = "chef/ubuntu-12.04"

  config.vm.provision :shell, :inline => "apt-get update -y; apt-get install -y -q curl; curl -L https://www.opscode.com/chef/install.sh | sudo bash"

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
  end

  # Run the host with a host-only IP of 172.22.22.22.
  config.vm.network :private_network, ip: "172.22.22.22"
end
