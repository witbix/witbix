#!/usr/bin/env bash

set -xe

perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.example > .env