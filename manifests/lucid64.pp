node default {
    package {
        'build-essential': ensure => latest;
        'libusb-dev': ensure => latest;
        'vim': ensure => latest;
    }
}
