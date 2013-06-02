define apt::ppa($key=undef) {

  exec { "add-apt-key-${name}":
    command => $key ? {
        /.+/ => "/usr/bin/wget -O - '${key}' | /usr/bin/apt-key add -",
        undef => "/bin/true",
    },
    require => Package["wget"];
  }

  exec { "apt-update-${name}":
    command => "/usr/bin/aptitude update",
    refreshonly => true,
  }

  exec { "add-apt-repository-${name}":
    command => "/usr/bin/add-apt-repository '${name}'",
    notify => Exec["apt-update-${name}"],
    unless => $name ? {
      /ppa:(.*)/ => "/bin/cat /etc/apt/sources.list /etc/apt/sources.list.d/* | /bin/egrep '^[^#].*ppa.*$1.*$'",
      default => "/bin/cat /etc/apt/sources.list /etc/apt/sources.list.d/* | /bin/egrep '^[^#].*${title}.*$'",
    },
    require => [Exec["add-apt-key-${name}"], Package["python-software-properties"]],
    logoutput => true,
  }
}

define apt::pin(
  $organization,
  $packages = '*',
  $priority = 0,
) {

  file { "${name}.pref":
    name => "/etc/apt/preferences.d/${name}",
    ensure => file,
    owner => root,
    group => root,
    mode => 644,
    content => "# ${name}\nPackage: ${packages}\nPin: release o=${organization}\nPin-Priority: ${priority}",
  }
}
