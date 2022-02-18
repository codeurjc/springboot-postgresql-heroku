#!/bin/bash

heroku create $1

mvn spring-boot:build-image -Dspring-boot.build-image.imageName=registry.heroku.com/$1/web

docker push registry.heroku.com/$1/web

heroku config:set SPRING_SSL_ENABLED=false --app $1

heroku container:release web -a $1

heroku logs --tail -a $1