Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ms-ubuntu-11.10"

  # Download the box automatically from S3.
  config.vm.box_url = "http://msonnabaum-public.s3.amazonaws.com/ms-ubuntu-11.10.box"

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

  # Run the host with a host-only IP of 172.22.22.22.
  config.vm.network :hostonly, "172.22.22.22"
  config.ssh.max_tries = 1000

  # Forward port 22 to localhost:2222.
  config.vm.forward_port 22, 2222
end
