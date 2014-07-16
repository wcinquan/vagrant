class php (
	$php_packages = ['php', 'php-common', 'php-mysql'],
	$version = '5.3.3-27.el6_5'
) {

  package {
	$php_packages:
		ensure => $version;
  }
}
