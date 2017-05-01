Vagrant.configure("2") do |config|
  config.vm.define "crpmbuilder" do |centos|
    centos.vm.hostname = "crpmbuilder"
    centos.vm.provider "docker" do |d|
      d.image = "kshlm/vagrant-centos:latest"
      d.has_ssh = true
      d.remains_running = true
      d.name = "crpmbuilder"
      d.volumes = [ENV["PWD"]+":/vagrant", ENV["PWD"]+"/yum-cache:/var/cache/yum", ENV["PWD"]+"/mock-cache:/var/cache/mock"]
      d.create_args=["--privileged", "--cap-add", "SYS_PTRACE"]
    end

    centos.vm.provision :ansible do |ansible|
      ansible.playbook = 'ansible/initialize.yml'
      ansible.sudo = true
    end
  end
end
