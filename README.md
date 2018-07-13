# ubuntu-jdk8-liquibase
Liquibase project containing changelog files

docker run -itd -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=TIMESHEET --name db -p 3306:3306 mysql:5.7.22

docker build -t ubuntu-jdk8-liquibase:latest --network="host" .

docker run -itd --name ubuntu-jdk8-liquibase --link db:localhost ubuntu-jdk8-liquibase:latest
