
# Ansible

## Description

This image as based on the Python 3.8 slim. Execution of ansible and ansible-playbook commands as ansible user, SSH key can be built-in into /home/ansible/.ssh.  
More information on the Ansible website https://ansible.com

## How to use this image

### As part of Ansible project

Check [example](https://github.com/mrsombre/docker-ansible/blob/master/example) folder.

### Ad-hoc commands and testing environments

```bash
docker pull mrsombre/ansible
# test connection to a remote server using login / password (change <Server IP> to a real IP)
docker run --rm -it mrsombre/ansible ansible all -u root -k -m raw -a 'uname -a' -i '<Server IP>,'
```
