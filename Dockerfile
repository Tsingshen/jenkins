FROM jenkinsci/jenkins:2.60.1

USER root

# Install Docker client
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 17.03.1-ce
ENV DOCKER_COMPOSE_VERSION 1.16.1

RUN set -x \
  && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
  && tar -xzvf docker.tgz \
  && mv docker/* /usr/local/bin/ \
  && rmdir docker \
  && rm docker.tgz \
  && docker -v

RUN set -x \
  && curl -fSL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose \
  && docker-compose -v

RUN install-plugins.sh \
  active-directory \
  build-name-setter \
  build-pipeline-plugin \
  build-user-vars-plugin \
  buildtriggerbadge \
  cloudbees-folder \
  config-file-provider \
  copyartifact \
  dashboard-view \
  description-setter \
  disk-usage \
  docker-slaves \
  email-ext \
  envinject \
  gitlab-plugin \
  greenballs \
  job-dsl \
  jobConfigHistory \
  monitoring \
  pegdown-formatter \
  publish-over-cifs \
  publish-over-ftp \
  publish-over-ssh \
  role-strategy \
  security-inspector \
  subversion \
  tasks \
  test-results-analyzer \
  thinBackup \
  warnings \
  ws-cleanup

USER jenkins
