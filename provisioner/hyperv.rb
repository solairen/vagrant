Vagrant.configure("2") do |config|
  CONF["NODES"].each do |node|
    config.vm.boot_timeout = 500
    config.vm.define node["hostname"] do |nodeconfig|
      if node["os"] == "win2019"
        nodeconfig.vm.communicator = "winrm"
        nodeconfig.winrm.username = HYPERV_VIRTUALBOX_CREDENTIALS[:win_username]
        nodeconfig.winrm.password = HYPERV_VIRTUALBOX_CREDENTIALS[:win_password]
        nodeconfig.vm.box = TMPL["TEMPLATES"]["tpl"]
      elsif node["os"] == "sql2019"
        nodeconfig.vm.communicator = "winrm"
        nodeconfig.winrm.username = HYPERV_VIRTUALBOX_CREDENTIALS[:win_username]
        nodeconfig.winrm.password = HYPERV_VIRTUALBOX_CREDENTIALS[:win_password]
        nodeconfig.vm.box = TMPL["TEMPLATES"]["tpl1"]
      elsif node["os"] == "ubuntuserver"
        nodeconfig.ssh.insert_key = false
        nodeconfig.ssh.username = HYPERV_VIRTUALBOX_CREDENTIALS[:lnx_username]
        nodeconfig.ssh.password = HYPERV_VIRTUALBOX_CREDENTIALS[:lnx_password]
        nodeconfig.vm.box = TMPL["TEMPLATES"]["tpl2"]
      elsif node["os"] == "ubuntu20.04"
        nodeconfig.ssh.insert_key = false
        nodeconfig.ssh.username = HYPERV_VIRTUALBOX_CREDENTIALS[:lnx_username]
        nodeconfig.ssh.password = HYPERV_VIRTUALBOX_CREDENTIALS[:lnx_password]
        nodeconfig.vm.box = TMPL["TEMPLATES"]["tpl3"]
      elsif node["os"] == "debian10"
        nodeconfig.ssh.insert_key = false
        nodeconfig.ssh.username = HYPERV_VIRTUALBOX_CREDENTIALS[:lnx_username]
        nodeconfig.ssh.password = HYPERV_VIRTUALBOX_CREDENTIALS[:lnx_password]
        nodeconfig.vm.box = TMPL["TEMPLATES"]["tpl4"]
      end
      nodeconfig.vm.hostname = node["hostname"]
      nodeconfig.vm.synced_folder ".", "/vagrant", disabled: true
      nodeconfig.vm.network "public_network", bridge: node["switch"]
      nodeconfig.vm.provider "hyperv" do |hv|
        hv.ip_address_timeout = 240
        hv.vmname = node["hostname"]
        hv.memory = node["mem"]
        hv.cpus = node["cpus"]
        hv.enable_checkpoints = false
        hv.enable_automatic_checkpoints = false
      end
    end
  end
end