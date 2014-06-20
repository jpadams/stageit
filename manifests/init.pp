class stageit {

  file { '/opt/puppet/libexec/mcollective/mcollective/agent/stageit.rb':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/stageit/stageit.rb',
    notify => Service['pe-mcollective']
  } 
  
  file { '/opt/puppet/libexec/mcollective/mcollective/agent/stageit.ddl':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/stageit/stageit.ddl',
    notify => Service['pe-mcollective']
  } 

}
