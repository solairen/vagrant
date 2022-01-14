TPLS_PATH = "template_path"
VSPHERE_NETWORK_CONFIG = {
    :name => "{vlanName}",
}
VSPHERE_CREDENTIALS = {
    :win_username => "{win_user}",
    :win_password => "{win_pass}",
    :lnx_username => "{lnx_user}",
    :lnx_password => "{lnx_pass}",
}
VSPHERE_CONFIG = {
    :host => "{hostIP}",
    :user => "{userName}",
    :pass => "{password}",
    :base_path => "{path}/#{CONF["FOLDER"]["folder"]}",
    :compute_resource_name => "{clusterName}",
    :data_center_name => "{dataCenterName}",
    :data_store_name => "{dataStoreName}",
    #
    :centpl => "#{TPLS_PATH}/vagrant-centos",
    :ubunservtpl => "#{TPLS_PATH}/vagrant-ubuntuserver",
    :ubuntpl => "#{TPLS_PATH}/vagrant-ubuntu",
    :debiantpl => "#{TPLS_PATH}/vagrant-debian",
    :win2008tpl => "#{TPLS_PATH}/vagrant-win2008",
    :win2012tpl => "#{TPLS_PATH}/vagrant-win2012",
    :win2016tpl => "#{TPLS_PATH}/vagrant-win2016",
    :win2019tpl => "#{TPLS_PATH}/vagrant-win2019",
}