Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64-omnibus"
  config.vm.box_url = "https://s3.amazonaws.com/gsc-vagrant-boxes/ubuntu-12.04-omnibus-chef.box"

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
  config.vm.network :hostonly, "172.22.22.22"
  config.ssh.max_tries = 1000
end
