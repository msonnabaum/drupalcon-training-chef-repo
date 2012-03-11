
Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ms-ubuntu-11.10"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.roles_path = "roles"
    chef.add_role("web-server")
    chef.add_role("proxy-cache")
    chef.json.merge!({
    :mysql => {
      :server_root_password => ""
    }
  })
  end

  config.vm.forward_port 80, 8080
  config.vm.forward_port 8081, 8081
  config.vm.forward_port 3306, 8306
end
