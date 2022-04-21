FROM jenkins/jenkins

#ARG SSH_PRIVATE_KEY

USER root

RUN apt-get update
RUN apt-get install -y nano g++ build-essential software-properties-common 

# gpg keys listed at https://github.com/nodejs/node
RUN apt-get install ansible -y

RUN echo EST > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# Workdir for
WORKDIR /usr/src/app

# Install plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt

COPY entrypoint.sh /usr/src/app
# Authorize SSH Host
RUN mkdir -p /usr/share/jenkins/ref/.ssh && \
    chmod 0700 /usr/share/jenkins/ref/.ssh && \
    ssh-keyscan github.com > /usr/share/jenkins/ref/.ssh/known_hosts

RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

RUN chmod -R 600 /usr/share/jenkins/ref/.ssh

# Add the keys and set permissions
RUN echo "$SSH_PRIVATE_KEY" > /usr/share/jenkins/ref/.ssh/id_rsa && \
    chmod 600 /usr/share/jenkins/ref/.ssh/id_rsa

RUN chmod a+x ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
