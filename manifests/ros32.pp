Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

exec { 'apt-update':
  command => '/usr/bin/apt-get update';
}

Exec["apt-update"] -> Package <| |>

node default {
    apt::ppa { "http://packages.ros.org/ros/ubuntu": key => "http://packages.ros.org/ros.key"; }

    package {
        'wget': ensure => latest;
        'python-software-properties': ensure => latest;
        'ros-groovy-ros-base':
            ensure => latest,
            require => Apt::Ppa['http://packages.ros.org/ros/ubuntu'];
        'ros-groovy-ros-tutorials':
            ensure => latest,
            require => Apt::Ppa['http://packages.ros.org/ros/ubuntu'];
        'ros-groovy-common-tutorials':
            ensure => latest,
            require => Apt::Ppa['http://packages.ros.org/ros/ubuntu'];
    }
}
