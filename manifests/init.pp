
# Define: xinetd
#   Manages an xinetd configuration for a specific service
define xinetd ($ensure="present",
       $disable="no", $socket_type="stream", $wait="no", $server, 
       $protocol="", $user="root", $group="",
       $log_type="", $log_on_success="", $log_on_failure="",
       $nice="", $onlyfrom=[ ], $description="") {

   if $server {
      notice "Server provided"
   } else {
      err "No server provided for xinetd conf!"
   }

   include xinetd::common

   $filename = "/etc/xinetd.d/$name"

   # service defaults to name
   $service = $name

   file { $filename:
      ensure  => $ensure,
      mode    => 644,
      content => template("xinetd/xinetd.erb"),
      notify  => Service["xinetd"]
   }

}
