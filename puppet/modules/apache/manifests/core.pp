class apache::core (
  $version = '2.2.15-30.el6.centos',
  $enable = true,
  $service = 'httpd',
  $state = 'running'
) {

  package {
	$service:
	ensure => $version
  }

  service {
	$service:
	enable => $enabled,
	ensure => $state,
	require => Package [ $service ]
  }
}
