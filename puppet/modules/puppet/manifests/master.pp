class puppet::master {
  package {'puppet-server':
    ensure => installed,
  }

  file {'/etc/puppet/puppet.conf':
    ensure   => file, 
    owner => 'root',
    group => 'root',
    mode  => '0644',
    content  => template('puppet/puppet.master.conf.erb'),
    require  => Package['puppet-server'],
  }
}

