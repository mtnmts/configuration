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
RUN scripts/apt1.sh > $LOGS/apt1.log
RUN scripts/apt2.sh > $LOGS/apt2.log 
RUN scripts/apt3.sh > $LOGS/apt3.log
RUN scripts/apt4.sh > $LOGS/apt4.log
RUN scripts/apt5.sh > $LOGS/apt5.log
RUN scripts/apt6.sh > $LOGS/apt6.log 
RUN scripts/copy_config.sh > $LOGS/copy_config.log
RUN scripts/pyenv.sh > $LOGS/pyenv.log 
RUN scripts/python_setup.sh > $LOGS/python_setup.log 
RUN scripts/rust.sh > $LOGS/rust.log 
RUN scripts/misc.sh > $LOGS/misc.log 

CMD ["/usr/bin/fish"]
