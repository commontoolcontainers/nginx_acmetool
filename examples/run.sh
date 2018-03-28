#!/bin/bash

docker run --rm \
           -it \
           -e NAMES="example.com www.example.com" \
           -e EMAIL="admin@example.com" \
           -p 80:80 \
           -p 443:443 \
           -v /path/to/nginx/var/run/acme:/var/run/acme \
           -v /path/to/nginx/var/lib/acme:/var/lib/acme \
           -v /path/to/nginx/etc/nginx/conf.d:/etc/nginx/conf.d \
           -v /path/to/nginx/var/www:/var/www \
           commontools/nginx_acmetool 
