# Ansible

## Description

This image is based on the Python 3.8 (Debian-slim). Execution of ansible and ansible-playbook commands as ansible user. SSH key can be built-in into /home/ansible/.ssh.  
More information on the Ansible website https://ansible.com/.

## Latest versions

- `3.1.0` `3.1`
- `2.9.9` `2.9`

## Deprecated versions

- `2.8.11` `2.8`
- `2.7.17` `2.7`
- `2.6.20` `2.6`
- `2.5.15` `2.5`

## How to use this image

### As part of an Ansible project

Check this [example](./example) as docker-compose usage.

### Ad-hoc commands and testing environments

```bash
docker pull mrsombre/ansible
# test connection to a remote server using login / password (change <Server IP> to a real IP)
docker run --rm -it mrsombre/ansible:latest ansible all -u root -k -m raw -a 'uname -a' -i '<Server IP>,'
```
