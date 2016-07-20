#!/bin/sh

if [ -d /app/mysql ]; then
  echo "[i] MySQL directory already present, skipping creation"
else
  echo "[i] MySQL data directory not found, creating initial DBs"

  mysql_install_db --user=root > /dev/null

  if [ "$MYSQL_ROOT_PASSWORD" = "" ]; then
    MYSQL_ROOT_PASSWORD=111111
    echo "[i] MySQL root Password: $MYSQL_ROOT_PASSWORD"
  fi

  MYSQL_DATABASE=wordpressDB

  if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
  fi

  tfile=`mktemp`
  if [ ! -f "$tfile" ]; then
      return 1
  fi

  cat << EOF > $tfile
EOF

  if [ "$MYSQL_DATABASE" != "" ]; then
    echo "[i] Creating database: $MYSQL_DATABASE"
    echo "FLUSH PRIVILEGES;" >> $tfile
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;"

    echo "CREATE USER 'wordpressUser'@'localhost' IDENTIFIED BY 'wordpressUserPassword';" >> $tfile
    echo "CREATE USER 'wordpressUser'@'localhost' IDENTIFIED BY 'wordpressUserPassword';"

    echo "CREATE USER 'wordpressUser'@'%' IDENTIFIED BY 'wordpressUserPassword';" >> $tfile
    echo "CREATE USER 'wordpressUser'@'%' IDENTIFIED BY 'wordpressUserPassword';"

    echo "GRANT ALL PRIVILEGES ON * . * TO 'wordpressUser'@'localhost' WITH GRANT OPTION;" >> $tfile
    echo "GRANT ALL PRIVILEGES ON * . * TO 'wordpressUser'@'localhost' WITH GRANT OPTION;"

    echo "GRANT ALL PRIVILEGES ON * . * TO 'wordpressUser'@'%' WITH GRANT OPTION;" >> $tfile
    echo "GRANT ALL PRIVILEGES ON * . * TO 'wordpressUser'@'%' WITH GRANT OPTION;"

    echo "FLUSH PRIVILEGES;" >> $tfile
  fi

  /usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
  rm -f $tfile
fi

exec /usr/bin/mysqld --user=root --console
