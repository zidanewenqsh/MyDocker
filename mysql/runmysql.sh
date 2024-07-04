#!/bin/bash
docker run --name mysql-container \
	-e MYSQL_ROOT_PASSWORD=my-secret-pw \
	-v $HOME/mysql-data:/var/lib/mysql \
	-p 3306:3306 \
	-d \
	mysql
