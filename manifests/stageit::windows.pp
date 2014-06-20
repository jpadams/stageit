class stageit::windows {

  file { 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective/agent/stageit.rb':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/stageit/stageit_win.rb',
    notify => Service['pe-mcollective']
  }

  file { 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective/agent/stageit.ddl':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/stageit/stageit.ddl',
    notify => Service['pe-mcollective']
  }

}
