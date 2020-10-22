#!/bin/sh

docker exec net640kb_web_1 /bin/sh -c "kill -SIGHUP 9 || kill -s 1 9"
docker exec net640kb_nginx_1 /bin/sh -c "nginx -s reload"
