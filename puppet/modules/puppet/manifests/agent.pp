class puppet::agent ($master_hostname = 'puppet-master.local',
                     $master_ip       = '192.168.100.10')
{
  package {'puppet':
    ensure => installed,
  }
  
  host { $master_hostname:
    ensure => present,
    ip     => $master_ip,
  }

  file { '/etc/puppet/puppet.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('puppet/puppet.agent.conf.erb'),
    require => Package['puppet'],
  }

  service { 'puppet':
    ensure => running,
    require => Package['puppet']
  }
}
