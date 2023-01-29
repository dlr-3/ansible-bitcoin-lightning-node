# Ansible Bitcoin Lightning Node Bootstrapper 

## Table of Contents
+ [About](#about)
+ [Getting Started](#getting_started)
+ [Usage](#usage)
+ [Contributing](../CONTRIBUTING.md)

## About <a name = "about"></a>
This project is meant to compile from source, install and run bitcoin core, lightning, on major linux OS/architectures
Raspberry Pi 4 supported and tested! Rocky Linux, Debian, and more!

This project does not use docker or related technology. All software installed by this automation suite is downloaded and
compiled from verified 3rd party sources wherever possible, and is intended to give full transparency and control to the
bitcoin node operator.

## Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine.

First, clone this repository onto the host that will run bitcoind, and run the `bash_install_ansible.sh` script

```commandline
    cd && mkdir git && cd git && \
    git clone https://github.com/dlr-3/ansible-bitcoin-lightning-node.git && \
    ./ansible-bitcoin-lightning-node/bash_install_ansible.sh
```

All users must enter some information into **user_input.yml** before deploying bitcoin and/or lightning

The minimum required edits are as follows:

1. update ```bitcoin_node_vars.node_rpc_username``` to a unique username value
2. update ```bitcoin_node_vars.node_rpc_username``` to a unique password value
3. edit data_root to point to your formatted and mounted file system which will contain the blockchain and related data
4. If you are planning to wipe and/or format a new device:
   1. change ```bitcoin_node_vars.reformat_device``` to "True"
   2. make sure data_root points to an empty or missing directory. The default of "/data" is fine as long as you do not have a file or directory by the same name already
   3. WARNING: DATA LOSS -- set ```bitcoin_node_vars.device_path``` to the path of your device, such as /dev/sdd2. Any data on this device will be lost.

Now, with these edits done, we are ready to deploy bitcoin. Copy and paste this to a terminal with root privilege:

```commandline
    ansible-playbook bitcoin_node.yml -K -i inventory.yml 
```

That's it! if all goes well, bitcoin should be running with systemd under bitcoind.service 

You can stop and disable it with ```sudo systemctl disable --now bitcoind``` 

### Prerequisites

1. root access to supported Linux operating system (Debian, Ubuntu, Raspbian, Rocky, Oracle)
2. mounted partition on said Linux OS with sufficient storage space to hold the ever-growing BTC blockchain data 
3. Stable internet connectivity

OS/architecture Compatibility matrix:


|                     | aarch64       | x86_64    |
| :------------------ |:-------------:| :--------:|
| Debian 11           | supported     | supported |
| Ubuntu 20           | supported     | supported |
| Raspbian (Bullseye) | supported     |           |
| Rocky Linux 8, 9    | supported     | supported |
| Oracle Linux 8, 9   |               | supported |

### Installing

A step by step series of examples that tell you how to get a development env running.

Install this repository from github as the root user (or your preferred sudo-user)

```
git clone https://www.github.com/dlr-3/this-repo-name.git
```

Run the bash kick-starter script to install ansible


```
until finished
```

End with an example of getting some data out of the system or using it for a little demo.

## Usage <a name = "usage"></a>

Add notes about how to use the system.
