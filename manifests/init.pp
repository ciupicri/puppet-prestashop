class prestashop {
    include httpd
    include php, php::gd, php::mysql

    # workaround for bug https://github.com/duritong/puppet-mysql/issues/2
    if $mysql_exists == 'true' {
        include mysql::server
    } else {
        package { "mysql-server": ensure => installed }
    }
}
