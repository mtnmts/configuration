FROM "ubuntu:18.04"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt upgrade -y
RUN apt install -y wget zip sudo 
WORKDIR /
RUN wget https://github.com/mtnmts/configuration/archive/master.zip
RUN unzip master.zip 
WORKDIR /configuration-master
ENV LOGS /var/log/setup-script/

RUN mkdir -p $LOGS
RUN chmod +x scripts/*
RUN ls -laR .
RUN scripts/apt1.sh
RUN scripts/apt2.sh
RUN scripts/apt3.sh
RUN scripts/apt4.sh
RUN scripts/apt5.sh
RUN scripts/apt6.sh
RUN scripts/copy_config.sh
RUN scripts/pyenv.sh
RUN scripts/python_setup.sh
RUN scripts/rust.sh
RUN scripts/misc.sh

CMD ["/usr/bin/fish"]
