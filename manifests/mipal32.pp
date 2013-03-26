Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

exec { 'apt-update':
  command => '/usr/bin/apt-get update';
}

Exec["apt-update"] -> Package <| |>

node default {
    apt::ppa { "ppa:esteve/upfmipal": }

    package {
        'wget': ensure => latest;
        'python-software-properties': ensure => latest;
        'bmake':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-back-common':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-back0.20-art':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-back0.20-cairo':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-base-common':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-base-runtime':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-common':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-gui-common':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-gui-runtime':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'gnustep-make':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'libantlr3c-3.4-0':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'libantlr3c-dev':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'libblocksruntime-dev':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'libblocksruntime0':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'libgnustep-base-dev':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'libgnustep-base1.22':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'libgnustep-gui0.20':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'mknfonts.tool':
            ensure => latest,
            require => Apt::Ppa['ppa:esteve/upfmipal'];
        'build-essential': ensure => latest;
        'clang': ensure => latest;
        'gsoap': ensure => latest;
        'pmake': ensure => latest;
        'cmake': ensure => latest;
        'libavahi-core-dev': ensure => latest;
        'libavahi-client-dev': ensure => latest;
        'libavahi-cil-dev': ensure => latest;
        'libavahi-compat-libdnssd1': ensure => latest;
        'python-dev': ensure => latest;
        'libicu-dev': ensure => latest;
        'ghc6': ensure => latest;
        'libffi-dev': ensure => latest;
        'libcairo2-dev': ensure => latest;
        'libart-2.0-dev': ensure => latest;
        'portaudio19-dev': ensure => latest;
        'libxslt-dev': ensure => latest;
        'libreadline-dev': ensure => latest;
        'libjpeg62-dev': ensure => latest;
        'libtiff4-dev': ensure => latest;
        'libpng12-dev': ensure => latest;
        'libgif-dev': ensure => latest;
        'libgnutls-dev': ensure => latest;
        'libsndfile1-dev': ensure => latest;
        'libasound2-dev': ensure => latest;
        'alsa-oss': ensure => latest;
        'libao-dev': ensure => latest;
        'libaspell-dev': ensure => latest;
        'libxt-dev': ensure => latest;
        'libxext-dev': ensure => latest;
        'libxft-dev': ensure => latest;
        'mdns-scan': ensure => latest;
        'subversion': ensure => latest;
        'libcups2-dev': ensure => latest;
        'flite1-dev': ensure => latest;
        'libdispatch-dev': ensure => latest;
        'libqt4-dev': ensure => latest;
        'autoconf': ensure => latest;
        'libtool': ensure => latest;
        'doxygen': ensure => latest;
        'graphviz': ensure => latest;
        'graphviz-dev': ensure => latest;
        'llvm-3.0': ensure => latest;
        'libgmp3c2': ensure => latest;
        'libmpfr4': ensure => latest;
        'libmpfr-dev': ensure => latest;
        'libmpc2': ensure => latest;
        'libmpc-dev': ensure => latest;
        'git': ensure => latest;
        'libusb-dev': ensure => latest;
        'libopencv-dev': ensure => latest;
        'libcv-dev': ensure => latest;
        'libhighgui-dev': ensure => latest;
    }
}
# build-essential gobjc++ clang gsoap pmake cmake libavahi-core-dev  libavahi-client-dev libavahi-cil-dev libavahi-compat-libdnssd1 python-dev libicu-dev ghc6 libffi-dev libcairo2-dev libart-2.0-dev portaudio19-dev libxslt-dev libreadline-dev libjpeg62-dev libtiff4-dev libpng12-dev libgif-dev libgnutls-dev libsndfile1-dev libasound2-dev alsa-oss libao-dev libaspell-dev libxt-dev libxext-dev libxft-dev mdns-scan subversion libcups2-dev flite1-dev libdispatch-dev libqt4-dev autoconf libtool doxygen graphviz graphviz-dev llvm-3.0 libgmp3c2 libmpfr4 libmpfr-dev libmpc2 libmpc-dev
