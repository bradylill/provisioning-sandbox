#!/bin/sh

yum update -y
rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
yum install -y puppet
puppet apply /provision_scripts/manifests/puppet_agent.pp --modulepath=/provision_scripts/modules
