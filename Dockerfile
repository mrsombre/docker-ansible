
FROM python:3.8.8-slim

ARG DEBIAN_FRONTEND=noninteractive
RUN set -eux; \
    apt-get update; \
    fetchList=" \
      gosu \
      unzip \
      ssh-client \
      sshpass \
    "; \
    apt-get install -y --no-install-recommends ${fetchList}; \
    rm -rf /var/lib/apt/lists/*

ARG VERSION=3.1.0
RUN set -eux; \
    pip3 install --upgrade pip setuptools wheel cffi; \
    pip3 install --upgrade ansible==${VERSION}; \
    rm -rf /root/.cache

# add ansible user and mount point
ARG ANSIBLE_UID=1000
ARG ANSIBLE_GID=1000
RUN set -eux; \
    groupadd -g ${ANSIBLE_GID} -r ansible \
      && useradd -u ${ANSIBLE_UID} -r -m -g ansible ansible; \
   mkdir -p /home/ansible/.ssh \
      && echo 'Host *\n  LogLevel ERROR\n  StrictHostKeyChecking no' | tee /home/ansible/.ssh/config \
      && chown ansible:ansible -R /home/ansible

USER ansible:ansible
WORKDIR /opt/ansible

# docker entrypoint
COPY docker-entrypoint.sh /docker-entrypoint
ENTRYPOINT ["/docker-entrypoint"]
CMD ["ansible", "--version"]

LABEL image.name="mrsombre/ansible" \
      image.scm-url="https://github.com/mrsombre/docker-ansible"
