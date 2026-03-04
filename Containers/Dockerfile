FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    lib32gcc-s1 \
    lib32stdc++6 \
    libstdc++6 \
    curl \
    ca-certificates \
    libsdl2-2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /steamcmd && chown ubuntu:ubuntu /steamcmd

USER ubuntu
WORKDIR /home/ubuntu

RUN cd /steamcmd && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

ENTRYPOINT ["/bin/bash", "/home/ubuntu/launch.sh"]