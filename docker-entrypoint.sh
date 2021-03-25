#!/usr/bin/env bash

# first arg is an option
if [[ ${1#-} != ${1} ]]; then
  set -- ansible-playbook "$@"
fi

exec "$@"
