#!/bin/bash

git pull origin master
mvn clean install
mvn liquibase:update -Dliquibase-database-password=root