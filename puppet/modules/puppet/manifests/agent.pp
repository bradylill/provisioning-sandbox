class puppet::agent {
  $puppet_master = '192.168.100.10'
  $puppet_master_host = 'puppet-master.local'

  package {'puppet-server':
    ensure => installed,
  }
  
  host { 'puppet-master.local':
    ensure => present,
    ip     => $puppet_master
  }

  file { '/etc/puppet/puppet.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('puppet/puppet.agent.conf.erb'),
    require => Package['puppet-server'],
  }

  service { 'puppet':
    ensure => running,
    require => File['/etc/puppet/puppet.conf']
  }
}
