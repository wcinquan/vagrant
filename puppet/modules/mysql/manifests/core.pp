class mysql::core (
  $server_version = '5.1.73-3.el6_5',
  $server_package = 'mysql-server',
  $server_init = 'mysqld',

  $client_version = '5.1.73-3.el6_5',
  $client_package = 'mysql',

  $mysql_lib_version = '5.1.73-3.el6_5',
  $mysql_lib_package = 'mysql-libs',

  $enabled = true,
  $state = 'running'
) {

  package {
	$server_package:
		ensure => $server_version,
		require => Package [ $mysql_lib_package ];
	$client_package:
		ensure => $client_version,
		require => Package [ $mysql_lib_package ];
	$mysql_lib_package:
		ensure => $mysql_lib_version;
  }

  service {
	$server_init:
	enable => $enabled,
	ensure => $state,
	require => Package [ $server_package ]
  }
}
