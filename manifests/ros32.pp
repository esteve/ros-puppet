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
        'python-rosdep':
            ensure => latest,
            require => Apt::Ppa['http://packages.ros.org/ros/ubuntu'];
        'ros-groovy-catkin':
            ensure => latest,
            require => Apt::Ppa['http://packages.ros.org/ros/ubuntu'];
    }
}

exec {'rosdep-init':
    command => '/usr/bin/rosdep init',
    require => Package['python-rosdep'],
    creates => '/etc/ros/rosdep/sources.list.d/20-default.list';
}

exec {'rosdep-update':
    command => '/usr/bin/rosdep update',
    require => Exec['rosdep-init'];
}

file {"/home/vagrant/.bashrc":
  source => "puppet:///modules/user/bashrc",
  mode   => 644,
  owner => 'vagrant',
  group => 'vagrant',
  require => Package['ros-groovy-catkin'];
}
