#!/bin/bash

git reset --hard origin/master
mvn liquibase:update -Dliquibase-database-password=root