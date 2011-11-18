class prestashop {
    include php, php::gd, php::mysql, php::mcrypt

    # workaround for bug https://github.com/duritong/puppet-mysql/issues/2
    if $mysql_exists == 'true' {
        Class["mysql::server::service"]
            -> Class["httpd::service"]
            -> Class["prestashop"]
    } else {
        include mysql::server::install
    }
}
