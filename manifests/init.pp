#Class: php_fastcgi
class php_fastcgi(
  $user          = 'www-data',
  $group         = 'www-data',
  $address       = '127.0.0.1',
  $port          = '9000',
  $children      = '1',
  $max_requests  = '1000',
  $start         = true,
  $start_on      = 'filesystem and static-network-up',
  $respawn       = true,
  $respawn_limit = '10 5',
  $options       = '-q -b',
) {

  $packages = ['php5-cgi', 'php5-cli', 'psmisc' ]
  package{$packages:
    ensure => latest,
  }

  file {'php-fcgi.conf':
    ensure  => file,
    path    => '/etc/init/php-fcgi.conf',
    content => template('php_fastcgi/php-fcgi.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  service {'php-fcgi':
    ensure   => $start ? {
      true   => running,
      false  => undef,
    },
    enable   => $start,
    provider => upstart,
  }

  Package['php5-cgi']   -> File['php-fcgi.conf'] -> 
    Service['php-fcgi']

  File['php-fcgi.conf'] ~> Service['php-fcgi']

}
