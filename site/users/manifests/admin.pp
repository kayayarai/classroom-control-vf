user::managed_user {'jose':
  ensure => present,
}
user::managed_user {'alice':
  ensure => present,
}
user::managed_user {'chen':
  ensure => present,
}
