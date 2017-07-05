FROM jenkinsci/jenkins:2.60.1

USER root

# Install Docker client
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 17.03.1-ce

RUN set -x \
  && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz" -o docker.tgz \
  && tar -xzvf docker.tgz \
  && mv docker/* /usr/local/bin/ \
  && rmdir docker \
  && rm docker.tgz \
  && docker -v

RUN install-plugins.sh \
  active-directory \
  ansible \
  blueocean \
  cloudbees-folder \
  config-file-provider \
  copyartifact \
  docker-slaves \
  email-ext \
  envinject \
  gitlab-plugin \
  publish-over-ssh

USER jenkins
