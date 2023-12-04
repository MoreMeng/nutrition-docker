## Docker PHP 7.3 Apache MySQL with PDO

- libpng-dev
- libjpeg-dev
- libfreetype6-dev
- libzip-dev
- zlib1g-dev
- libpq-dev

### docker-php-ext-install
- gd
- pdo
- pdo_mysql
- pdo_pgsql
- mysqli
- pgsql

### Disabling ONLY_FULL_GROUP_BY on MySQL

    command:
        --sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION

# .env file
    MYSQL_ROOT_PASSWORD=password
    MYSQL_USER=root
    MYSQL_PASSWORD=password
    MYSQL_DATABASE=database_name