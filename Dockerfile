FROM python:3.8.3-slim

RUN set -eux; \
    apt-get update && apt-get install -y \
      gosu \
      sshpass \
    ; \
    rm -rf /var/lib/apt/lists/*

ARG VERSION=2.9.9
RUN set -eux; \
    pip3 install --upgrade pip setuptools wheel; \
    pip3 install --upgrade \
      ansible==${VERSION} \
      pywinrm \
    ; \
    rm -rf /root/.cache

# add ansible user and mount point
ARG TESTER_UID=2000
ARG TESTER_GID=2000
RUN set -eux; \
    groupadd -g ${TESTER_GID} -r ansible \
      && useradd -u ${TESTER_UID} -r -m -g ansible ansible; \
   mkdir -p /home/ansible/.ssh \
      && echo 'Host *\n  LogLevel ERROR\n  StrictHostKeyChecking no' | tee /home/ansible/.ssh/config \
      && chown ansible:ansible -R /home/ansible

WORKDIR /opt/ansible

# docker entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]
CMD ["ansible", "--version"]

LABEL image.name="mrsombre/ansible" \
      image.scm-url="https://github.com/mrsombre/docker-ansible"
