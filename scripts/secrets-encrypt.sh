#!/usr/bin/env bash

tar cvf secrets.tar secrets/*
travis encrypt-file secrets.tar secrets.tar.enc --add --force
rm secrets.tar