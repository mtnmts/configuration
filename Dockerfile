FROM "ubuntu:18.04"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt upgrade -y
RUN apt install -y wget zip sudo 
WORKDIR /
RUN wget https://github.com/mtnmts/configuration/archive/master.zip
RUN unzip master.zip 
WORKDIR /configuration-master
ENV LOGS /var/log/setup-script/

RUN bash mkdir -p ${LOGS}
RUN chmod +x scripts/*
RUN bash scripts/apt.sh &> ${LOGS}/apt.log
RUN bash scripts/copy_config.sh &> ${logs}/copy_config.log
RUN bash scripts/pyenv.sh &> ${logs}/pyenv.log
RUN bash scripts/python_setup.sh &> ${logs}/python_setup.log
RUN bash scripts/rust.sh &> ${logs}/rust.log
RUN bash scripts/misc.sh &> ${logs}/misc.log

CMD ["/usr/bin/fish"]
