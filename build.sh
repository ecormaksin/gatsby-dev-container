#!/usr/bin/env bash

cd `dirname $0`

docker compose build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) --no-cache
