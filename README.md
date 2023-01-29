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
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

See [deployment](#deployment) for notes on how to deploy the project on a live system.



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
