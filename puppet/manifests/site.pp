node puppetmaster {
  include puppet::master
}

node puppetagent {
  include puppet::agent
}

node 'puppet-master.local' inherits puppetmaster {}

node 'puppet-agent1.local' inherits puppetagent {
}

node 'puppet-agent2.local' inherits puppetagent{
}

