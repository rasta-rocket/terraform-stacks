FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server python && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/run/sshd; \
    passwd -d root; \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    sed -i 's/PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config; \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config;

CMD ["/usr/sbin/sshd", "-D"]
