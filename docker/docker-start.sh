#!/usr/bin/env bash

set -e

role=${CONTAINER_ROLE:-app}

if [ "$role" = "app" ]; then
  echo "starting php-fpm ..."
  php-fpm
elif [ "$role" = "queue" ]; then

  echo "Running the queue..."
  php /var/www/artisan queue:work --verbose --tries=3 --timeout=90
fi