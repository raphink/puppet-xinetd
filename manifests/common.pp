

class xinetd::common {

   $xinetd_conf         = "/etc/xinetd.conf"
   $xinetd_confroot     = "/etc/xinetd.d"

   $xinetd_package      = "xinetd"
   $xinetd_service      = "xinetd"

   package { $xinetd_package: 
          ensure => installed,
	  before => File[$xinetd_conf]
   }

   file { $xinetd_conf:
      ensure  => present,
      mode    => 644,
      source  => "puppet:///xinetd/xinetd.conf",
      notify  => Service[xinetd];
   }

   service { $xinetd_service:
      require => Package[xinetd]
   }

}


