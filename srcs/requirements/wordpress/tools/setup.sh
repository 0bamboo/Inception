if ! [ -d /var/www/html/wordpress ] ; then
mkdir -p /var/www/html/wordpress

#install wordpress
wp core download --path=/var/www/html/wordpress --allow-root

# Create wp-config.php file with the following settings: with redis
wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --path=/var/www/html/wordpress --allow-root --skip-check  --extra-php <<PHP
define('WP_CACHE_KEY_SALT', getenv('DOMAIN_NAME'));
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis');
define('NONCE_SALT',       '$(echo $RANDOM | md5sum | head -c 64)');
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
PHP

# Install wordpress configuration with Administator user and password
wp core install --url=$DOMAIN_NAME --title=abdait-m --admin_user=$MYSQL_USER --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=abdait-m@abdait-m.abdait-m --allow-root --path=/var/www/html/wordpress

# create a new user
wp user create nowl01 nowl01@1337.ma --user_pass=$MYSQL_PASSWORD --role=author --path=/var/www/html/wordpress --allow-root

# add Redis cache plugin
wp plugin install redis-cache --path=/var/www/html/wordpress --activate --allow-root
wp redis enable --path=/var/www/html/wordpress --allow-root

fi
exec "$@"