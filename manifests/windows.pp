class stageit::windows {

  file { 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective/agent/stageit.rb':
    ensure => file,
    source => 'puppet:///modules/stageit/stageit_windows.rb',
    owner  => Administrator,
    group  => Administrators,
    mode   => '0644',
    notify => Service['pe-mcollective']
  }

  file { 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective/agent/stageit.ddl':
    ensure => file,
    source => 'puppet:///modules/stageit/stageit.ddl',
    owner  => Administrator,
    group  => Administrators,
    mode   => '0644',
    notify => Service['pe-mcollective']
  }

}
