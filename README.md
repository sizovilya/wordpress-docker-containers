

## Run:

Go to root dir
```
chmod +x setUpWordpress.sh
```
next
```
./setUpWordpress.sh
```


## Manual run

```
docker-compose up -d
```

```
docker exec -i mysql mysql -u root wordpressDb < dbBackup.sql
```

## For update site files or db backup

> Copy new site files to apache/files/site/

> Run for mysql db backup restore:  docker exec -i mysql mysql -u root wordpressDb < dbBackup.sql

