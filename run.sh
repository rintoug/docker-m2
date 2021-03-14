#!/bin/sh

curl -O https://p-lux1.pcloud.com/cfZyMhS6sZKVhnHMZBG7J7ZZ97BlG7Z2ZZEe5ZZtxv2pZXzZqFZpZ2pZuFZ1zZ8zZxpZKJZjzZ4pZf5ZOHZP5ZqRurkg7LEvRfKPXTqWzgbJnCwdPy/magento-ce-2.4.1-2020-09-25-04-17-23.tar.gz
mkdir src

tar -xvf magento-ce-2.4.1-2020-09-25-04-17-23.tar.gz -C src

rm magento-ce-2.4.1-2020-09-25-04-17-23.tar.gz


docker-compose exec web php bin/magento setup:install --base-url="http://localhost:8091/" --db-host="db" --db-name="magento2" --db-user="root" --db-password="test123@123" --admin-firstname="admin" --admin-lastname="admin" --admin-email="admin@admin.com" --admin-user="admin" --admin-password="admin@123" --language="en_US" --currency="USD" --timezone="America/Chicago" --use-rewrites="1" --backend-frontname="admin" --elasticsearch-host="es01" --elasticsearch-port="9200"
docker-compose exec web php bin/magento setup:di:compile
docker-compose exec web php bin/magento module:disable Magento_TwoFactorAuth
docker-compose exec web php bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=magento2_redis --page-cache-redis-db=1
docker-compose exec web php bin/magento setup:config:set --cache-backend=redis --cache-backend-redis-server=magento2_redis --cache-backend-redis-db=0