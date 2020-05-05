#!/bin/bash
set -eo pipefail

# first arg is an option
if [[ ${1#-} != ${1} ]]; then
  set -- ansible-playbook "$@"
fi

# execute as ansible
if [[ ${1} == 'ansible' || ${1} == 'ansible-playbook' ]]; then
  exec gosu ansible "$@"
fi

exec "$@"
