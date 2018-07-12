#!/bin/bash

git fetch --all
git reset --hard origin/master
mvn package
mvn liquibase:update -Dliquibase-database-password=root