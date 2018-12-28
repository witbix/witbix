#!/bin/sh

for ep in /entrypoint.d/*.sh; do
  if [ -x "${ep}" ]; then
    echo "Running: ${ep}"
    "${ep}"
  fi
done

exec "$@"