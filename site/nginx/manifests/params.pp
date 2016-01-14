class nginx::params {
  case $::osfamily {
    'redhat': {
      $packagename = 'nginx'
      $ownername   = 'root'
      $groupname   = 'root'
    # $docroot     = '/var/www'
      $configpath  = '/etc/nginx'
      $blockpath   = '/etc/nginx/conf.d'
      $logpath     = '/var/log/nginx'
      $servicename = 'nginx'
      $serviceuser = 'nginx'
      $default_docroot     = '/var/www'
    }
    'debian': {
      $packagename = 'nginx'
      $ownername   = 'root'
      $groupname   = 'root'
    # $docroot     = '/var/www'
      $configpath  = '/etc/nginx'
      $blockpath   = '/etc/nginx/conf.d'
      $logpath     = '/var/log/nginx'
      $servicename = 'nginx'
      $serviceuser = 'www-data'
      $default_docroot     = '/var/www'
    }
    'windows': {
      $packagename = 'nginx-service'
      $ownername   = 'Administrator'
      $groupname   = 'Administrators'
    # $docroot     = 'C:/ProgramData/nginx/html'
      $configpath  = 'C:/ProgramData/nginx'
      $blockpath   = 'C:/ProgramData/nginx/conf.d'
      $logpath     = 'C:/ProgramData/nginx/logs'
      $servicename = 'nginx'
      $serviceuser = 'nobody'
      $default_docroot     = 'C:/ProgramData/nginx/html'
    }
    default: {
        fail("Operating system ${::osfamily} is not supported.")
    }
  }
  
  $docroot = $root ? {
    undef => $default_docroot,
    default => $root,
  }
}
