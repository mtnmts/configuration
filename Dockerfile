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
RUN scripts/apt1.sh > $LOGS/apt1.log
RUN scripts/apt2.sh > $LOGS/apt2.log 2>&1
RUN scripts/apt3.sh > $LOGS/apt3.log 2>&1
RUN scripts/apt4.sh > $LOGS/apt4.log 2>&1
RUN scripts/apt5.sh > $LOGS/apt5.log 2>&1
RUN scripts/apt6.sh > $LOGS/apt6.log 2>&1
RUN scripts/copy_config.sh > $LOGS/copy_config.log 2>&1
RUN scripts/pyenv.sh > $LOGS/pyenv.log 2>&1
RUN scripts/python_setup.sh > $LOGS/python_setup.log 2>&1
RUN scripts/rust.sh > $LOGS/rust.log 2>&1
RUN scripts/misc.sh > $LOGS/misc.log 2>&1

CMD ["/usr/bin/fish"]
