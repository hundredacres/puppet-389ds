# This is in a very preliminary stage

class 389ds {

    include yum::epel

    yumrepo { 'cr' :
        baseurl   => 'http://mirror.ovh.net/ftp.centos.org/6/cr/x86_64/',
        descr     => 'CentOS-6 - cr',
        enabled   => 1,
        gpgcheck  => 0,
    }

    yumrepo { '389-ds-base' :
        baseurl   => 'http://repos.fedorapeople.org/repos/rmeggins/389-ds-base/epel-6/x86_64/',
        descr     => '389-ds-base package for EL6',
        enabled   => 1,
        gpgcheck  => 0,
    }

    package { '389-ds' :
        ensure   => present,
        provider => 'yum',
        requires => [ Yumrepo[ 'cr', '389-ds-base' ], Class[ 'yum::epel' ], ],
        # requires the EPEL repo too
    }
}
