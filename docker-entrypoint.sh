#!/bin/sh
set -eo pipefail

# first arg is an option
if [ "${1#-}" != "$1" ]; then
  set -- ansible-playbook "$@"
fi

if [[ "$1" == 'ansible' || "$1" == 'ansible-playbook' ]]; then
  exec su-exec ansible "$@"
fi

exec "$@"
