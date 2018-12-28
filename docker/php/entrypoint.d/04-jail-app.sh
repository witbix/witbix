#!/bin/sh

# Restrict some applications acess to root user only
if [ $(which gosu) ]; then
    gosu root chmod o-rwx /bin/su
    gosu root chmod o-rwx /usr/bin/gosu
fi