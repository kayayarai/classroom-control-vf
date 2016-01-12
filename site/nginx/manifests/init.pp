class nginx {

package { 'nginx':
  ensure => 'present',
}

file {'/etc/nginx/':
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
  requires => Package['nginx'],

}

service { 'nginx':
  ensure => 'running',
  enable => true,
  subscribe => File['/etc/nginx/nginx.conf'],

}

}
