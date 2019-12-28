FROM "ubuntu:18.04"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt upgrade -y
RUN apt install -y wget zip sudo 
RUN wget https://github.com/mtnmts/configuration/archive/master.zip
RUN unzip master.zip && cd configuration-master/ && chmod +x ./install.sh && ./install.sh > /var/log/install.log 2>&1
CMD ["/usr/bin/fish"]
