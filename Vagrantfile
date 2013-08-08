# -*- mode: ruby -*-
# vi: set ft=ruby :

def provisioner(vm_name)
  vm_name.to_s.split("_").first
end

Vagrant.configure("2") do |config|
  config.vm.box = "centos64-64"

 vms = {:puppet_master => {:hostname => "puppet-master.local",
                           :ip       => "192.168.100.10",
                           :bootstrap => "puppet_master.sh"},
        :puppet_agent1 => {:hostname  => "puppet-agent1.local",
                           :ip        => "192.168.100.20",
                           :bootstrap => "puppet_agent.sh"},
        :puppet_agent2 => {:hostname  => "puppet-agent2.local",
                           :ip        => "192.168.100.21",
                           :bootstrap => "puppet_agent.sh"},
        :babushka_test => {:hostname  => "babushka-test.local",
                           :ip        => "192.168.100.30",
                           :bootstrap => "bootstrap.sh"}}
  
  vms.each_pair do |name, options|
    config.vm.define name do |vm|
      vm.vm.hostname=options[:hostname]
      vm.vm.network :private_network, ip: options[:ip]
      vm.vm.synced_folder "#{provisioner name}", "/provision_scripts"
      vm.vm.provision :shell, :inline => "/provision_scripts/bootstrap/#{options[:bootstrap]}"
      vm.vm.provider :virtualbox do |vb|
        vb.name = name.to_s
      end
    end
  end
  
  # config.vm.box_url = "http://domain.com/path/to/above.box"
  # config.vm.network :forwarded_port, guest: 80, host: 8080
end
