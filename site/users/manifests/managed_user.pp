define users::managed_user (
  $homedir = "/${title}",
  $group = "admins",
){
user { $title:
  ensure => present,
  }
  
file {"/home/${title}":
  ensure => directory,
  owner => $title,
  group => 'admins',
  mode => '0755',

}
file { "/home/${title}/welcome.txt":
    ensure  => file,
    owner   => $title,
    group   => 'admins',
    mode    => '0644',
    source => 'users/welcome.txt',


}
}
