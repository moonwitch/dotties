#!/bin/bash

#docker ps --format 'table {{.Image}}\t{{.RunningFor}}'
docker ps -a --format "table {{.Image}}\t{{.Status}}\t{{.Names}}" #| awk -F$"\t" '{printf "%s|%s|%s\n", $1, $2, $3}'

