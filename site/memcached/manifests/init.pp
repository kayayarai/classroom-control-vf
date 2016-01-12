class memcached {

  package {'memcached':
    ensure => 'present';
    before => File['mem'],
  
  }
  
  file {'/etc/sysconfig/memcached':
    ensure => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/memcached/memcached',
    }
    
  service {'memcached':
    ensure => 'running',
    enable => true,
    subscribe => File['/etc/sysconfig/memcached'],
    }
  }
