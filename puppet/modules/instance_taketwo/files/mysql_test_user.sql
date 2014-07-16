insert into user (Host, User, Password) values ('localhost', 'test', Password('fixed'));
GRANT ALL ON test.* TO 'test';
FLUSH PRIVILEGES;
