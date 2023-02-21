FROM ubuntu:22.04

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y git vim curl wget \
  && rm -rf /var/lib/apt/lists/*

#RUN useradd -ms /bin/bash apprunner
#USER apprunner

WORKDIR /usr/local/bin
COPY build.sh .
RUN chmod +x build.sh

ARG RELEASE=1.3.3

# wget https://github.com/encointer/encointer-parachain/releases/download/1.3.3/encointer-collator
#RUN wget --no-check-certificate "https://github.com/encointer/encointer-parachain/releases/download/${RELEASE}/encointer-collator"
RUN ./build.sh
RUN chmod +x encointer-collator

ENTRYPOINT [ "/usr/local/bin/encointer-collator" ]
