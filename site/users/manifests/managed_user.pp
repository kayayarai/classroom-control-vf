define users::managed_user (
  $homedir = "/${title}",
  $group = "root",
){
user { $title:
  ensure => present,
  }
  
file {"/home/${title}":
  ensure => directory,
  owner => $title,
  group => 'root',
  mode => '0755',

}
file { "/home/${title}/welcome.txt":
    ensure  => file,
    owner   => $title,
    group   => 'root',
    mode    => '0644',
    source => "puppet:///users/welcome.txt",


}
}
