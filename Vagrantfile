Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20240821.0.1"

  config.ssh.insert_key = true
  config.vm.hostname = "Lab01-gRPC"

  config.vm.network "private_network", ip: "192.168.33.17"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
    vb.name = "Lab01-gRPC"
  end

  config.vm.provision "shell", path: "script-provision.sh", privileged: false

end