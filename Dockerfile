FROM ubuntu-jdk8-dev:latest

ENV LIQUIBASE_PROJECT_DIR=${LIQUIBASE_PROJECT_DIR:-.}\
    LIQUIBASE_DATABASE_DRIVER=${LIQUIBASE_DATABASE_DRIVER:-com.mysql.cj.jdbc.Driver}\
    LIQUIBASE_DATABASE_URL=${LIQUIBASE_DATABASE_URL:-jdbc:mysql://localhost:3306/TIMESHEET}\
    LIQUIBASE_DATABASE_USERNAME=${LIQUIBASE_DATABASE_USERNAME:-root}\
    LIQUIBASE_DATABASE_PASSWORD=${LIQUIBASE_DATABASE_PASSWORD:-root}

ADD ${LIQUIBASE_PROJECT_DIR} /usr/local/ubuntu-jdk8-liquibase

WORKDIR /usr/local/ubuntu-jdk8-liquibase

RUN mvn clean install
RUN mvn liquibase:update\
    -Dliquibase-database-driver=${LIQUIBASE_DATABASE_DRIVER}\
    -Dliquibase-database-url=${LIQUIBASE_DATABASE_URL}\
    -Dliquibase-database-username=${LIQUIBASE_DATABASE_USERNAME}\
    -Dliquibase-database-password=${LIQUIBASE_DATABASE_PASSWORD}

COPY bin/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["/bin/sh", "-i"]