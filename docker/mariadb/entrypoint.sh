#!/bin/bash

set -eo pipefail

# Execute pool of scripts as root before mysql starts
for ep in /entrypoint.d/*.sh; do
  if [ -x ${ep} ]; then
    echo "Running: ${ep}"
    "${ep}"
  fi
done

exec /docker-entrypoint.sh ${@}