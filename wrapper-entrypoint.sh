#!/bin/sh

python3 /setup-default-server.py

exec /entrypoint.sh "$@"
