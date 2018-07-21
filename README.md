# Image for ubuntu-jdk8-liquibase
This is a liquibase project containing docker and changelog files.

## Dockerfile
To build this image, first start a MySQL server container using the command below:
```
$ docker run -itd -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=TIMESHEET --name db -p 3306:3306 mysql:5.7.22
```
And to build the liquibase image itself:
```
$ docker build -t ubuntu-jdk8-liquibase:latest --network="host" .
```
To run the liquibase container of the previously built image:
```
docker run -itd --name ubuntu-jdk8-liquibase --link db:localhost ubuntu-jdk8-liquibase:latest
```
## Docker compose
Another and more convenient way of running MySQL and liquibase containers is running a docker compose with those definitions:

```
$ docker-compose up -d
```
And to stop the containers:
```
$ docker-compose down
```