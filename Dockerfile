FROM "ubuntu:18.04"
RUN wget https://github.com/mtnmts/configuration/archive/master.zip
RUN unzip master.zip && chmod +x ./install.sh && ./install.sh
CMD ["/usr/bin/fish"]
