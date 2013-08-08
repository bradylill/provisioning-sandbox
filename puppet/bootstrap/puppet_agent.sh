#!/bin/sh

#yum update -y
rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
yum install -y puppet
puppet apply -e 'include puppet::agent' --modulepath=/provision_scripts/modules
