class instance_taketwo::vhost (
	$document_root = '/var/www/html',
	$server_name = 'broken.box.local',
	$port = '80',
) {

  include mysql
  include php

  apache::vhost {
	'taketwo':
        	content => template('instance_taketwo/vhost-taketwo.conf.erb'),
  }
}
