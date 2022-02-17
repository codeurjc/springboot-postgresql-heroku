# springboot-postgresql-heroku

Aplicación web springboot que se conecta a una PostgreSQL. 

Se puede desplegar con docker-compose o en Heroku.

Características:
* Aplicación web implementada con Spring MVC y templates Mustache.
* Base de datos PostgreSQL
* Persistencia de imágenes en la base de datos 
* Carga de imágenes en los datos de ejemplo
* Posibilidad de editar las imágenes
* Seguridad con https

## Ejecución en local

Se require una base de datos PostgreSQL disponible en localhost con la siguiente configuración:
* Esquema: `books`
* Usuario: `postgres`
* Contraseña: `password`

Se puede arrancar usando docker con el comando:

```
$ docker run --rm -e POSTGRES_PASSWORD=password -e POSTGRES_DB=books -p 5432:5432 -d postgres:14.2
```

La aplicación se ejecuta con el comando:

```
mvn spring-boot:run
```

## Ejecución con docker-compose

Creación de imagen:

```
$ mvn spring-boot:build-image -Dspring-boot.build-image.imageName=codeurjc/springboot-postgresql-heroku
```

Arranque del docker-compose:

```
$ docker-compose up 
```

### Despliegue en Heroku