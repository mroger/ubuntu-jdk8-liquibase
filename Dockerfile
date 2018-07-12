FROM ubuntu-jdk8-dev:latest

ADD . /usr/local/ubuntu-jdk8-liquibase

WORKDIR /usr/local/ubuntu-jdk8-liquibase

RUN mvn clean install
RUN mvn liquibase:update -Dliquibase-database-password=root

COPY bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["/bin/sh", "-i"]