FROM mrsombre/ansible

COPY --chown=ansible:ansible ssh /home/ansible/.ssh
RUN set -eux; \
    chmod 0400 /home/ansible/.ssh/*

ENV ANSIBLE_CONFIG=/opt/ansible/ansible.cfg
