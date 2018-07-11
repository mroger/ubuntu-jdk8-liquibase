FROM ubuntu-jdk8-dev:latest

ADD . /usr/local/ubuntu-jdk8-liquibase

WORKDIR /usr/local/ubuntu-jdk8-liquibase

RUN git pull origin master && \
  mvn clean install && \
  mvn liquibase:update -Dliquibase-database-password=root

#CMD ["echo", "Liquibase Docker"]