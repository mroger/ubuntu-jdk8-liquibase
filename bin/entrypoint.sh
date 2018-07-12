#!/bin/bash

git pull origin master
mvn liquibase:update -Dliquibase-database-password=root