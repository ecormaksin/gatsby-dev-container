#!/usr/bin/env bash

TARGET_USER=gatsby

usermod -u $USER_ID -o -m $TARGET_USER
groupmod -g $GROUP_ID $TARGET_USER

chown -R $TARGET_USER:$TARGET_USER /src/site

tail -f /dev/null
