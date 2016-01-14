class nginx (
  $packagename = $nginx::params::packagename,
  $ownername   = $nginx::params::ownername,
  $groupname   = $nginx::params::groupname,
  $configpath  = $nginx::params::configpath,
  $blockpath   = $nginx::params::blockpath,
  $logpath     = $nginx::params::logpath,
  $servicename = $nginx::params::servicename,
  $serviceuser = $nginx::params::serviceuser,
  $docroot     = $nginx::params::docroot,
) inherits nginx::params {

File {
  owner => $ownername,
  group => $groupname,
  mode  => '0644',
  }
package { $packagename:
  ensure => 'present',
}

file {[$configpath, '/var/www/', $docroot, $blockpath]:
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
file {"${blockpath}/default.conf":
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
