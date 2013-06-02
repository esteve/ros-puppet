Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

exec { 'apt-update':
  command => '/usr/bin/apt-get update';
}

Exec["apt-update"] -> Package <| |>

node default {
    apt::ppa { "http://packages.ros.org/ros/ubuntu": key => "http://packages.ros.org/ros.key"; }
    apt::ppa { "ppa:chris-lea/zeromq": }
    apt::ppa { "ppa:wnoronha/thrift": }

    package {
        'wget': ensure => latest;
        'python-software-properties': ensure => latest;
        'vim': ensure => latest;
        'git': ensure => latest;
        'dpkg': ensure => latest;
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
        'python-twisted-web':
            ensure => latest;
        'socat':
            ensure => latest;
        'ipython':
            ensure => latest;
        'pep8':
            ensure => latest;
        'pylint':
            ensure => purged;
        'pyflakes':
            ensure => latest;
        'thrift-compiler':
            ensure => latest,
            require => Apt::Ppa['ppa:wnoronha/thrift'];
        'python-thrift':
            ensure => latest,
            require => Apt::Ppa['ppa:wnoronha/thrift'];
        'libthrift-dev':
            ensure => latest,
            require => Apt::Ppa['ppa:wnoronha/thrift'];
        'mc':
            ensure => latest;
        'python-virtualenv':
            ensure => latest;
        'libzmq1':
            ensure => latest,
            require => Apt::Ppa['ppa:chris-lea/zeromq'];
        'python-pyzmq':
            ensure => latest,
            require => Apt::Ppa['ppa:chris-lea/zeromq'];
        'libffi-dev':
            ensure => latest;
        'python-wstool':
            ensure => latest;
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

exec {'set-vim-editor':
    command => '/usr/sbin/update-alternatives --set editor /usr/bin/vim.basic',
    require => Package['vim', 'dpkg'];
}

file {"/home/vagrant/.bashrc":
  source => "puppet:///modules/user/bashrc",
  mode   => 644,
  owner => 'vagrant',
  group => 'vagrant',
  require => Package['ros-groovy-catkin'];
}
