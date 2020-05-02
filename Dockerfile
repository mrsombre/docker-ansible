
FROM alpine:3.11.6

RUN set -eux; \
    apk add --no-cache \
      su-exec \
      ca-certificates \
      openssh-client \
      sshpass \
    ; \
    apk add --no-cache python3; \
    python3 -V; \
    \
    apk add --no-cache --virtual build \
      build-base \
      python3-dev \
      libffi-dev \
      openssl-dev \
    ; \
    pip3 install --upgrade pip; \
    pip3 install --upgrade cffi setuptools; \
    pip3 install --upgrade \
      ansible==2.5.5 \
      pywinrm \
    ; \
    ansible --version; \
    \
    python3 -m pip uninstall cffi setuptools pip -y; \
    rm -rf /usr/lib/python3*/ensurepip; \
    apk del build

# add ansible user and mount point
RUN set -ex; \
    addgroup -S ansible \
      && adduser -D -g '' -s /sbin/nologin -G ansible -S ansible; \
    \
    mkdir -p /home/ansible/.ssh \
      && echo -e 'Host *\n  LogLevel ERROR\n  StrictHostKeyChecking no' > /home/ansible/.ssh/config \
      && chown ansible:ansible -R /home/ansible; \
    \
    mkdir -p /opt/ansible \
      && chown ansible:ansible /opt/ansible

WORKDIR /opt/ansible

# docker entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]
CMD ["ansible", "--version"]
