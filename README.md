# nginx_acmetool

## Docker run command
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

## Compose / Docker swarm mode stack
    version: "3"
    services:
      nginx:
        image: commontools/nginx_acmetool
        environment:
          NAMES: "example.com www.example.com"
          EMAIL: "admin@example.com"
        ports:
          - "80:80"
          - "443:443"
        volumes:
          - /path/to/nginx/var/run/acme:/var/run/acme
          - /path/to/nginx/var/lib/acme:/var/lib/acme
          - /path/to/nginx/etc/nginx/conf.d:/etc/nginx/conf.d
          - /path/to/nginx/var/www:/var/www

