define prestashop::shop(mysql_password) {
    if $mysql_exists == 'true' {
        mysql_database { "ps_${name}":
            ensure => present,
        }
        mysql_user { "ps_${name}@%":
            password_hash => mysql_password($mysql_password),
            ensure        => present,
            require       => Mysql_database["ps_${name}"],
        }
        mysql_grant { "ps_${name}@%/ps_${name}":
            privileges => ['all'],
            require    => Mysql_user["ps_${name}@%"],
        }
    }
}
