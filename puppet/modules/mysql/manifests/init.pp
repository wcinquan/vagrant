class mysql (
	$mysql_root = '/var/lib/mysql',
	$mysql_user = 'mysql',
	$mysql_server_config = '/etc/my.cnf'
) {

  include mysql::core

  # only fix the mysql permissions if it's NOT running - in 99% of the cases this won't run
  exec { "fix_mysql_perms_if_offline":
	path => '/bin,/usr/bin',
	command => "/bin/chown -R ${mysql_user}:${mysql_user} /var/lib/mysql/",
	unless => '/usr/bin/test -e /var/run/mysqld/mysqld.pid'
  }

  file {
	$mysql_server_config:
		ensure => present,
		owner => 'root',
		mode => '0600',
		content => template('mysql/my.cnf.erb')
  }
}
