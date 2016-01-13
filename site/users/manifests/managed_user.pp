define users::managed_user (
  $homedir = "/${title}",
  $group = "admins",
){
file { "/${title}/welcome.txt":
    ensure  => file,
    owner   => $title,
    group   => 'admins',
    mode    => '0644',
    source => 'users/welcome.txt',


}
}
