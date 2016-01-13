class nginx {

File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
  }
package { 'nginx':
  ensure => 'present',
}

file {['/etc/nginx', '/var/www', '/etc/nginx/conf.d']:
  ensure => 'directory',
}


file {'/etc/nginx/nginx.conf':
  ensure => file,
  source => 'puppet:///modules/nginx/nginx.conf',
  require => Package['nginx'],

}
file {'/var/www/index.html':
  ensure => file,
  source => 'puppet:///modules/nginx/index.html',

}
file {'/etc/nginx/conf.d/default.conf':
  ensure => file,
  source => 'puppet:///modules/nginx/default.conf',
  require => Package['nginx'],

}

service { 'nginx':
  ensure => 'running',
  enable => true,
  subscribe => [File['/etc/nginx/nginx.conf'],File['/etc/nginx/conf.d/default.conf']],
}


}
