FROM amd64/ubuntu:20.04

MAINTAINER chyiyaqing <chyiyaqing@gmail.com>

# locales and curl
RUN apt-get update && apt-get install -y locales curl && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Golang
ENV LANG en_US.UTF-8
ENV GOVERSION 1.17.5
ENV GOROOT /opt/go
ENV GOPATH /root/go

RUN cd /opt && curl -LO https://studygolang.com/dl/golang/go1.17.5.linux-amd64.tar.gz && \
    rm -rf ${GOROOT} && tar -xzf go${GOVERSION}.linux-amd64.tar.gz && \
    rm go${GOVERSION}.linux-amd64.tar.gz && \
    ln -s ${GOROOT}/bin/go /usr/bin/ && \
    mkdir $GOPATH

# NodeJS
RUN cd /opt && curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    # The NodeSource nodejs package contains both the node binary and npm
    apt install nodejs -y

# Install gcc
RUN apt-get install gcc -y

CMD ["/usr/bin/go"]
