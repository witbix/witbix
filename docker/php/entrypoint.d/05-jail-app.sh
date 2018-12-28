#!/bin/sh

# Restrict some applications acess to root user only
which su && gosu root chmod o-rwx /bin/su
which gosu && gosu root chmod o-rwx /usr/bin/gosu