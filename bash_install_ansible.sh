#!/bin/bash
# This script is intended to bootstrap ansible using standard linux package managers and public repositories

# List of packages
ANSIBLE_OS_PACKAGES='ansible'
ANSIBLE_GALAXY_COLLECTIONS='ansible.posix community.general'

# Detect package manager
if [ -x "$(command -v apt-get)" ]; then
    CMD="apt-get install --yes "
elif [ -x "$(command -v dnf)" ]; then
    CMD="dnf install -y "
    sudo dnf install -y epel-release
elif [ -x "$(command -v yum)" ]; then
    # DNF is preferred, but some outdated centos/rhel systems may still use yum
    CMD="yum install -y "
else
    echo "ERROR: No supported package manager found on your system. You must manually install ansible and python3."
    echo "If no package manager is available on your system, you might still be able to compile from source."
    echo "Official guide here: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html"
    echo "Sorry for the inconvenience."
    exit 1
fi

# Attempt to install with sudo and predicted CMD command
sudo $CMD $ANSIBLE_OS_PACKAGES
sudo ansible-galaxy collection install $ANSIBLE_GALAXY_COLLECTIONS

