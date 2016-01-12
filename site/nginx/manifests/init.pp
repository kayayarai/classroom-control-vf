class nginx {

package { 'nginx':
  ensure => 'present',
}

file {'/etc/nginx':
  ensure => 'directory',
  owner  => 'root',
  group  => 'root',
  mode   => '0755',
}

file {'/var/www':
  ensure => 'directory',
  owner  => 'root',
  group  => 'root',
  mode   => '0755',
}

file {'/etc/nginx/conf.d':
  ensure => 'directory',
  owner  => 'root',
  group  => 'root',
  mode   => '0755',
}

file {'/etc/nginx/nginx.conf':
  ensure => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => 'files:///modules/nginx/nginx.conf',
  require => Package['nginx'],

}
file {'/var/www/index.html':
  ensure => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => 'files:///modules/nginx/index.html',
  require => Package['nginx'],

}
file {'/etc/nginx/conf.d/default.conf':
  ensure => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => 'files:///modules/nginx/default.conf',
  require => Package['nginx'],

}

service { 'nginx':
  ensure => 'running',
  enable => true,
  subscribe => File['/etc/nginx/nginx.conf'],
  subscribe => File['/etc/nginx/conf.d/default.conf'],
}


}
