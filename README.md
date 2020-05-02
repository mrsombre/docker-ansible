
# Docker: Ansible

## Description

This is a docker image with ansible based on alpine linux

## How to use

### As base image

Dockerfile:
```dockerfile
FROM mrsombre/ansible:latest
```

### Ad-hoc commands
```bash
# show version
docker run --rm -it mrsombre/ansible

# test connection to a remote server using login/password
docker run --rm -it mrsombre/ansible \
  ansible all -m raw -a 'uname -a' \
  -u root -k -i '10.52.x.x,'
```
