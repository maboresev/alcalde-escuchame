PROJECT = tfg
PHP = tfg_web
DB = tfg_db
THEME_FRONT = tfg_front
THEME_ADMIN = tfg_admin

ir_web:
	docker exec -it -u 1000 ${PHP} bash
ir_db:
	docker exec -it -u 0 ${DB} bash
composer_install:
	docker exec -it -u 1000 ${PHP} bash -c "cd /var/www/html/src && composer install"
drush_cr:
	docker exec -it -u 1000 ${PHP} bash -c "cd /var/www/html/src && drush cr"
drush_cim:
	docker exec -it -u 1000 ${PHP} bash -c "cd /var/www/html/src && drush cim"
drush_cex:
	docker exec -it -u 1000 ${PHP} bash -c "cd /var/www/html/src && drush cex"
drush_updb:
	docker exec -it -u 1000 ${PHP} bash -c "cd /var/www/html/src && drush updb -y"
fix_permissions:
	docker exec -it -u 1000 ${PHP} bash -c "sudo sh /var/www/html/fix-permissions.sh --drupal_path=/var/www/html/src/web --drupal_user=developer --httpd_group=www-data"
apache_log:
	docker exec -it -u 1000 ${PHP} bash -c "sudo tail -fn100 /var/log/apache2/error.log"
composer_require:
	docker exec -it -u 1000 ${PHP} bash -c "cd /var/www/html/src && composer require ${MODULE}"
drush_en:
	docker exec -it -u 1000 ${PHP} bash -c "cd /var/www/html/src && drush en ${MODULE}"
drush_pmu:
	docker exec -it -u 1000 ${PHP} bash -c "cd /var/www/html/src && drush pmu ${MODULE}"
admin_css:
	cd ./src/web/themes/custom/${THEME_FRONT} && npm run css
admin_watch:
	cd ./src/web/themes/custom/${THEME_FRONT} && npm run watch
front_css:
	cd ./src/web/themes/custom/${THEME_ADMIN} && npm run css
front_watch:
	cd ./src/web/themes/custom/${THEME_ADMIN} && npm run watch

