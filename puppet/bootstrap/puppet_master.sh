#!/bin/sh

yum update -y
rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
yum install -y puppet-server
puppet master
yum install -y httpd httpd-devel mod_ssl mod_passenger ruby-devel rubygems gcc vim
gem install rack
puppet apply /provision_scripts/manifests/puppet_master.pp --modulepath=/provision_scripts/modules
