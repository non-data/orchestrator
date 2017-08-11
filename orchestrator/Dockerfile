FROM centos
RUN yum install -y https://github.com/github/orchestrator/releases/download/v2.1.2/orchestrator-2.1.2-1.x86_64.rpm
RUN useradd orchestrator && \
    echo 'orchestrator:password' | chpasswd

RUN yum -y install openssh-server
USER orchestrator
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""

RUN echo 'host *' >> ~/.ssh/config
RUN echo '    StrictHostKeyChecking no' >> ~/.ssh/config
RUN chmod 600 ~/.ssh/config
COPY config/orchestrator.conf.json /etc/.
COPY sh/failover.sh /usr/local/orchestrator/
USER root
RUN chown orchestrator:orchestrator /usr/local/orchestrator/failover.sh
RUN chmod +x /usr/local/orchestrator/failover.sh

RUN echo '/etc/init.d/orchestrator start' > /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT ["/sbin/init"]
