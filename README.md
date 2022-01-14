### Prerequisites
* [vagrant](https://www.vagrantup.com/)
* [vagrant-vsphere plugin](https://github.com/nsidc/vagrant-vsphere)

### How to use

#### _Edit `vagrant/infrastructure.in.yaml`:_

*PROVISIONER*
>hyperv, vsphere, virtualbox

*Note*
> name: some note

*FOLDER*
> folder: create folder were VM will be created. It is connected with *vsphere.in.rb* `base_path:` 

*Nodes*
```yaml
hostname: "{VMname}" => set name for hostname
os: "ubuntu20.04" => select OS: debian10, ubuntuserver, ubuntu20.04, win2019, sql2019
mem: 2096 => set memory in MB
cpus: 2 => set CPU cores
ip: "{setIP}" => set IP for VM (not supported on vsphere)
switch: "{Default Switch}" => set virtual adapter for Hyper-V and Virtualbox
```

#### _Edit `vsphere.in.rb`:_

```ruby
TPLS_PATH = "test/test => path to os templates
```

*VSPHERE_NETWORK_CONFIG*
```ruby
:name: "{vlanName}", => enter VLAN name
```

*VSPHERE_CREDENTIALS*
```ruby
win_username: "{win_user}" => enter windows username
win_password: "{win_pass}" => enter windows password
lnx_username: "{lnx_user}" => enter linux username
lnx_password: "{lnx_pass}" => enter linux password
```

*VSPHERE_CONFIG*
```ruby
:host => "{hostIP}", => host IP or name 
:user => "{userName}", => enter you username
:pass => "{password}", => enter your password
:base_path => "{path}", => add path where VM should be created
:compute_resource_name => "{clusterName}", => enter resource name
:data_center_name => "{dataCenterName}", => enter datacenter name
:data_store_name => "{dataStoreName}", => enter data store name
```

#### _templates.in.yaml_
*HyperV, Virtualbox*

only for hyperv and virtualbox provider, values below are not being used when vsphere provider was chosen.
```yaml
tpl: "gusztavvargadr/windows-server-standard"
tpl1: "gusztavvargadr/sql-server-developer-windows-server"
tpl2: "gusztavvargadr/ubuntu-server"
tpl3: "bento/ubuntu-20.04"
tpl4: "generic/debian10""
```

### Provisioner
*Vsphere*

Those tempaltes should be created on vsphere
```txt
vagrant-centos
vagrant-ubuntu
vagrant-ubuntuserver
vagrant-debian
vagrant-win2008
vagrant-win2012
vagrant-win2016
vagrant-win2019
```

### When you're ready
* When the file is ready just execute `vagrant up --provider=[vsphere, hyperv, virtualbox]` => choose one
* To destroy `vagrant destroy`
* To destroy faster or in case of problems `vagrant destroy -f`

#### HyperV works only on Windows
#### VirtualBox works on Windows, Linux and UNIX
#### On Linux 
start VirtualBox:
* as root `sudo virtualbox`

or change owner of the following directories to localuser:
* `sudo chown <localuser>:<localgroup> /path/to/repo/`
* `sudo chown <localuser>:<localgroup> $HOME/.vagrant.d`