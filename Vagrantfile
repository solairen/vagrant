# -*- mode: ruby -*-
# vi: set ft=ruby :
require "yaml"
CONF = YAML.load_file("./infrastructure.in.yaml")
TMPL = YAML.load_file("./templates.in.yaml")

if CONF["PROVISIONER"] == "vsphere"
  require "./config/vsphere.in.rb"
  require "./provisioner/vsphere.rb"
elsif CONF["PROVISIONER"] == "hyperv"
  require "./provisioner/hyperv.rb"
  require "./config/hyperv_virtualbox.in.rb"
elsif CONF["PROVISIONER"] == "virtualbox"
  require "./provisioner/virtualbox.rb"
  require "./config/hyperv_virtualbox.in.rb"
end