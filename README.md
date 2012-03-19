## Testing this repo using vagrant

    git clone git@github.com:msonnabaum/drupalcon-training-chef-repo.git
    cd drupalcon-training-chef-repo
    vagrant up

This will take a decent amount of time as the virtual machine is downloaded and the Chef configuration is applied. When it is done, you can connect to the server using `vagrant ssh`.

Once the server is running, you can navigate to http://172.22.22.22/ to test Apache and http://172.22.22.22:8080/ to test Varnish.
