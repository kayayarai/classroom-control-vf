class nginx {

case $::osfamily {
  'redhat': {
    $packagename = 'nginx'
    $ownername   = 'root'
    $groupname   = 'root'
    $docroot     = '/var/www'
    $configpath  = '/etc/nginx'
    $blockpath   = '/etc/nginx/conf.d'
    $logpath     = '/var/log/nginx'
    $servicename = 'nginx'
    $serviceuser = 'nginx'
  }
  'debian': {
    $packagename = 'nginx'
    $ownername   = 'root'
    $groupname   = 'root'
    $docroot     = '/var/www'
    $configpath  = '/etc/nginx'
    $blockpath   = '/etc/nginx/conf.d'
    $logpath     = '/var/log/nginx'
    $servicename = 'nginx'
    $serviceuser = 'www-data'
  }
  'windows': {
    $packagename = 'nginx-service'
    $ownername   = 'Administrator'
    $groupname   = 'Administrators'
    $docroot     = 'C:/ProgramData/nginx/html'
    $configpath  = 'C:/ProgramData/nginx'
    $blockpath   = 'C:/ProgramData/nginx/conf.d'
    $logpath     = 'C:/ProgramData/nginx/logs'
    $servicename = 'nginx'
    $serviceuser = 'nobody'
  }
  default: {
      fail("Operating system ${::osfamily} is not supported.")
  }
}

File {
  owner => $ownername,
  group => $groupname,
  mode  => '0644',
  }
package { $packagename:
  ensure => 'present',
}

file {[$configpath, $docroot, $blockpath]:
  ensure => 'directory',
}


file {"${configpath}/nginx.conf":
  ensure  => file,
  content => template('nginx/nginx.conf.erb'),
  require => Package[ $packagename ],
  notify  => Service[$servicename],
}
file {"${docroot}/index.html":
  ensure => file,
  source => 'puppet:///modules/nginx/index.html',

}
file {"${blockroot}/default.conf":
  ensure  => file,
  content => template('nginx/default.conf.erb'),
  require => Package[$packagename],
  notify  => Service[$servicename],
}

service { $servicename:
  ensure => 'running',
  enable => true,
}


}
