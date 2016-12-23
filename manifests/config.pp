class sniffle::config {
  $base = "/opt/local/fifo-sniffle"
  $file = "sniffle.conf"
  $conf = "/data/sniffle/etc/${file}"

  $ip        = $facts['ipaddress']
  $port      = 4200
  $ring_size = 64


  include fifo_test::config

  file { $conf:
    require => [ File["${base}/etc"], Exec["make_rel_sniffle"] ],
    source => "${base}/etc/${file}.example",
    ensure  => present,
  }

  augeas { $file:
    require => [ File[$conf], Package['ruby-augeas'] ],
    load_path => "/data/code/sniffle/_build/default/lib/fifo_utils/priv/lenses",
    context   => "/files${conf}",
    changes   =>
    [
     "set ring_size ${ring_size}",
     "set ip ${ip}:${port}",
     "set nodename sniffle@${ip}",
     ]
  }
  }
