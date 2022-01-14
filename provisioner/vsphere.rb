Vagrant.configure("2") do |config|
  CONF["NODES"].each do |node|
    config.vm.box = "vsphere"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.box_url = "./dummy.box"
    config.vm.boot_timeout = 500
    config.vm.define node["hostname"] do |nodeconfig|
      if node["os"] == "win2008"
        nodeconfig.vm.communicator = "winrm"
        nodeconfig.winrm.username = VSPHERE_CREDENTIALS[:win_username]
        nodeconfig.winrm.password = VSPHERE_CREDENTIALS[:win_password]
        nodeconfig.winrm.port = "5985"
        nodeconfig.winrm.ssl_peer_verification = false
        tpl = VSPHERE_CONFIG[:win2008tpl]
      elsif node["os"] == "win2012"
        nodeconfig.vm.communicator = "winrm"
        nodeconfig.winrm.username = VSPHERE_CREDENTIALS[:win_username]
        nodeconfig.winrm.password = VSPHERE_CREDENTIALS[:win_password]
        nodeconfig.winrm.port = "5985"
        nodeconfig.winrm.ssl_peer_verification = false
        tpl = VSPHERE_CONFIG[:win2012tpl]
      elsif node["os"] == "win2016"
        nodeconfig.vm.communicator = "winrm"
        nodeconfig.winrm.username = VSPHERE_CREDENTIALS[:win_username]
        nodeconfig.winrm.password = VSPHERE_CREDENTIALS[:win_password]
        nodeconfig.winrm.port = "5985"
        nodeconfig.winrm.ssl_peer_verification = false
        tpl = VSPHERE_CONFIG[:win2016tpl]
      elsif node["os"] == "win2019"
        nodeconfig.vm.communicator = "winrm"
        nodeconfig.winrm.username = VSPHERE_CREDENTIALS[:win_username]
        nodeconfig.winrm.password = VSPHERE_CREDENTIALS[:win_password]
        nodeconfig.winrm.port = "5985"
        nodeconfig.winrm.ssl_peer_verification = false
        tpl = VSPHERE_CONFIG[:win2019tpl]
      elsif node["os"] == "centos"
        nodeconfig.ssh.insert_key = false
        nodeconfig.ssh.username = VSPHERE_CREDENTIALS[:lnx_username]
        nodeconfig.ssh.password = VSPHERE_CREDENTIALS[:lnx_password]
        tpl = VSPHERE_CONFIG[:centpl]
      elsif node["os"] == "ubuntu"
        nodeconfig.ssh.insert_key = false
        nodeconfig.ssh.username = VSPHERE_CREDENTIALS[:lnx_username]
        nodeconfig.ssh.password = VSPHERE_CREDENTIALS[:lnx_password]
        tpl = VSPHERE_CONFIG[:ubuntpl]
      elsif node["os"] == "ubuntuserver"
        nodeconfig.ssh.insert_key = false
        nodeconfig.ssh.username = VSPHERE_CREDENTIALS[:lnx_username]
        nodeconfig.ssh.password = VSPHERE_CREDENTIALS[:lnx_password]
        tpl = VSPHERE_CONFIG[:ubunservtpl]
      else
        nodeconfig.ssh.insert_key = false
        nodeconfig.ssh.username = VSPHERE_CREDENTIALS[:lnx_username]
        nodeconfig.ssh.password = VSPHERE_CREDENTIALS[:lnx_password]
        tpl = VSPHERE_CONFIG[:debiantpl]
      end
      nodeconfig.vm.hostname = node["hostname"]
      nodeconfig.vm.provider :vsphere do |vsphere, override|
        vsphere.host = VSPHERE_CONFIG[:host]
        vsphere.vm_base_path = VSPHERE_CONFIG[:base_path]
        vsphere.compute_resource_name = VSPHERE_CONFIG[:compute_resource_name]
        vsphere.data_center_name = VSPHERE_CONFIG[:data_center_name]
        vsphere.data_store_name = VSPHERE_CONFIG[:data_store_name]
        vsphere.vlan = VSPHERE_NETWORK_CONFIG[:name]
        vsphere.template_name = "#{tpl}"
        vsphere.wait_for_sysprep = true
        vsphere.ip_address_timeout = 500
        vsphere.name = node["hostname"]
        vsphere.memory_mb = node["mem"]
        vsphere.cpu_count = node["cpus"]
        vsphere.notes = CONF["NOTE"]["name"]
        # vSphere login
        vsphere.user = VSPHERE_CONFIG[:user]
        vsphere.password = VSPHERE_CONFIG[:pass]
        vsphere.insecure = true
      end
    end
  end
end