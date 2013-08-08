node 'puppet-master.local' {
  notify {'I am a puppet master':}
  include puppet::master
}

node 'puppet-agent1.local' {
  notify {'I am a puppet agent1':}
  include puppet::agent
}

node 'puppet-agent2.local' {
  notify {'I am a puppet agent2':}
  include puppet::agent
}

