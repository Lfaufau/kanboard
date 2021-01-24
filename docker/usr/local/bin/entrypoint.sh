#!/bin/bash

chown -R www-data:www-data /app/data
chown -R www-data:www-data /app/plugins

php-fpm -F
