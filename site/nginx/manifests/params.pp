class nginx::params {
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
  
}
