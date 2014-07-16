class apache (
  $confdir = '/etc/httpd/conf.d',
) {

  include apache::core

  # make a custom puppet config
  file {
	$confdir:
		ensure => directory,
		owner => 'root',
		mode => 0755,
		purge => true
  }

  # we are taking over these!
  file {
	"${confdir}/virtual.conf":
		ensure => absent;

	"${confdir}/php.conf":
		ensure => present,
		owner => 'root',
		mode => '0640',
		content => template('apache/php.conf.erb');
  }
}


