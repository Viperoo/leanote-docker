## Docker for Leanote

```
docker-compose build

sudo mkdir -p /data/leanote/{conf,files,upload}
sudo cp -r conf /data/leanote
docker-compose up -d
```

### Migration

You need to migrate application (first run only). To do this, you need `mongorestore`.

```
docker exec -ti leanotedocker_server_1 sh

echo 'http://dl-3.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
echo 'http://dl-3.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
apk upgrade --update
apk add --update mongodb-tools
mongorestore -h db -d leanote --dir mongodb_backup/leanote_install_data
apk del --purge mongodb-tools

exit
```

Note that the imported database contains 2 user accounts by default

```
user1 username: admin, password: abc123 (administrator, used for backend management and control)  
user2 username: demo@leanote.com, password: demo@leanote.com (for demonstration purposes)
```
