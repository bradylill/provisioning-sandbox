class puppet::master {
  $autosign_certs = ['puppet-agent1.local', 'puppet-agent2.local']

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
  
  file {'/etc/puppet/autosign.conf':
    ensure   => file, 
    owner => 'root',
    group => 'root',
    mode  => '0644',
    content  => template('puppet/autosign.conf.erb'),
    require  => File['/etc/puppet/puppet.conf'],
  }

  service { 'puppet':
    ensure => running,
    require => File['/etc/puppet/autosign.conf']
  }

  service { 'puppetmaster':
    ensure => running,
    require => File['/etc/puppet/autosign.conf']
  }
}

