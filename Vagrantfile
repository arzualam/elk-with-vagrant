
Vagrant.configure("2") do |config|


  config.vm.define "elk-centos" do |subconfig|
    subconfig.vm.box = "centos/7"
    subconfig.vm.hostname= "elk-centos"
    subconfig.vm.network:private_network, ip: "192.168.30.41"
    subconfig.vm.provision "shell", inline: <<-SCRIPT
     sudo yum update 
     sudo yum install ansible -y
     sudo yum install git -y
     git clone https://github.com/arzualam/elk-with-vagrant
     ansible-playbook /home/vagrant/elk-ansible/elk-centos.yml
    SCRIPT
  end

end
