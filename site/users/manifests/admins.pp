class users::admins {

users::managed_user {'jose':
  ensure => present,
}
users::managed_user {'alice':
  ensure => present,
}
users::managed_user {'chen':
  ensure => present,
}
}
