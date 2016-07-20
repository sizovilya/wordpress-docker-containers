#!/bin/sh

docker-compose up -d

sleep 10

echo "restoring db..."

docker exec -i mysql mysql -u root wordpressDB < wordpressDB.sql
