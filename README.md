# Ansible Bitcoin Lightning Node Bootstrapper 

## Table of Contents
+ [About](#about)
+ [Getting Started](#getting_started)
+ [Usage](#usage)
+ [Contributing](../CONTRIBUTING.md)

## About <a name = "about"></a>

This project is meant to compile from source, install and run bitcoin core and lnd on x86 and arm64 linux platforms.
Designed to match major linux distributions including CentOS/Rocky/Oracle, Debian, and Rasbian on Rasberry Pi 4.

This project does not use docker or related technology. All software installed by this automation suite is configurable
and compiles directly from source code wherever possible. This design is intended to give full transparency and control 
to the node operator/developer.

My motivation for this project was to provide a simple and straightforward, yet highly configurable method to compile
and install bitcoin core and lightning without introducing any need to trust a third party (myself included!). These
compile and installation steps were sourced from the bitcoin core and lightning repository documentation.

### Prerequisites
1. root access to supported Linux operating system (Debian, Ubuntu, Raspbian, Rocky, Oracle)
2. available disk partition on your OS with enough space to hold the BTC blockchain data (1+ TB recommended)
3. Stable internet connectivity

OS/architecture Compatibility matrix:

|                     | aarch64       | x86_64    |
| :------------------ |:-------------:| :--------:|
| Debian 11           | supported     | supported |
| Ubuntu 20           | supported     | supported |
| Raspbian (Bullseye) | supported     |           |
| Rocky Linux 8, 9    | supported     | supported |


## Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine.


All users must enter some information into **user_input.yml** before deploying bitcoin and/or lightning

The required updates for the minimum bitcoin node install are:

1. update ```bitcoin_node_vars.node_rpc_username``` to a unique username value
2. update ```bitcoin_node_vars.node_rpc_username``` to a unique password value
3. edit ```bitcoin_node_vars.data_root``` to point to your formatted and mounted file system which will contain the blockchain and related data
4. If you are planning to wipe and/or format a new device:
   1. change ```bitcoin_node_vars.reformat_device``` to "True"
   2. make sure data_root points to an empty or missing directory. The default of "/data" is fine as long as you do not have a file or directory by the same name already
   3. WARNING: DATA LOSS -- set ```bitcoin_node_vars.device_path``` to the path of your storage device. Any data on this device will be lost.
   
In order to enable the lightning node install, make the following edits to the user_input.yml file:

1. update ```lightning_node_vars.enabled``` to ```true```.
2. recommended but not required to match the ```lightning_node_vars.data_root``` to ```bitcoin_node_vars.data_root```

This software is designed to successfully compile and install bitcoin and lightning together in one attempt, but it will
also work to install only a bitcoin node, or only install lightning on top of an existing running bitcoin node.

In the case that you already have a bitcoin node running, and only plan to install lightning on top:
   
1. set ```bitcoin_node_vars.enabled``` to ```false``` to prevent re-installing bitcoin.
2. update ```lightning_node_vars.enabled``` to ```true```.
3. update ```bitcoin_node_vars.node_rpc_username``` to your existing bitcoin RPC username value 
4. update ```bitcoin_node_vars.node_rpc_username``` to your existing bitcoin RPC password value


### Installing

As a user with root privilege, clone this repository onto the host that will run bitcoind, and run the 
`bash_install_ansible.sh` script. This will install ansible locally so you can run the automated install yourself.

If you already use ansible, or want to do a remote install on a managed computer, feel free to skip this step and modify
inventory.yml according to your own environment.

```commandline
    cd; mkdir -p git; cd git; \
    git clone https://github.com/dlr-3/ansible-bitcoin-lightning-node.git; \
    /bin/bash ansible-bitcoin-lightning-node/bash_install_ansible.sh
```

Once you have configured user_input.yml to match your use case, copy and paste this to your terminal to begin:

```commandline
    ansible-playbook bitcoin_node.yml -K -i inventory.yml 
```

This will ask for your password to run ansible with root privilege. This is necessary because this automation will
create a user, install software packages, and manage firewallD and systemD.

That's it! if all goes well, bitcoin should be running with systemd under bitcoind.service 

if lightning was installed, it will be running under lnd.service. The systemd service(s) can be checked with systemctl

bitcoin systemd service: ```systemctl status bitcoind.service```
lightning systemd service: ```systemctl status lnd.service```

the bitcoin debug log will be found at: 

```{{ bitcoin_node_vars['data_root'] }}/{{ bitcoin_node_vars['config_dir'] }}/logs/debug.log```

which would be the following file path using default configuration:
```/data/.bitcoin/logs/debug.log```
   


## Usage <a name = "usage"></a>

With a running lightning node, you can create a wallet with ```lncli create```

Learn more about using lncli with ```lncli help```
