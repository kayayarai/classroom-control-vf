define users::managed_user (
  $user,
  $homedir = "/${title}",
  $group = "restricted",
){
file { "/${title}/welcome.txt":
    ensure  => file,
    owner   => $title,
    group   => 'restricted',
    mode    => '0644',
    source => 'users/welcome.txt',


}
}
