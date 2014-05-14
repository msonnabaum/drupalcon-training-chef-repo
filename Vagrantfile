Vagrant.configure("2") do |config|
  # Adding Docker support just for msonnabaum.
  config.vm.provider "docker" do |d, override|
    d.image = "smerrill/vagrant-ubuntu"
    d.has_ssh = true

    # This is needed if you have non-Docker provisioners in the Vagrantfile.
    override.vm.box = nil

    # Ensure Vagrant knows the SSH port. See
    # https://github.com/mitchellh/vagrant/issues/3772.
    override.ssh.port = 22
  end

  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  # This is a box from Chef that will work on VirtualBox or VMware.
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
  config.vm.network :hostonly, "172.22.22.22"
  config.ssh.max_tries = 1000
end
