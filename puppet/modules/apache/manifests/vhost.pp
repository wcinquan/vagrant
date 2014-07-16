define apache::vhost(
  $content
) {

  include apache

  $inst = $name

  file {
      "${apache::confdir}/vhost-$inst.conf":
        ensure => present,
        owner => 'root',
        mode => '0600',
	content => $content,
	notify  => Service[$apache::core::service]
  }
}
