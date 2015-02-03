FROM ubuntu

RUN apt-get update && apt-get install -y wget
RUN mkdir -p /etc/confd/{conf.d,templates}
RUN mkdir /data
RUN wget https://github.com/syncthing/syncthing/releases/download/v0.10.21/syncthing-linux-amd64-v0.10.21.tar.gz
RUN tar zxvf syncthing*
RUN cp syncthing*/syncthing /bin/syncthing
ADD config.toml /etc/confd/conf.d/config.toml
ADD syncthing.tmpl /etc/confd/templates/syncthing.tmpl

#ADD syncthing /bin/syncthing
ADD confd /bin/confd
RUN chmod +x /bin/confd
ADD bootstrap /bin/bootstrap
ADD launch /bin/launch
EXPOSE 22000
EXPOSE 21025/udp
EXPOSE  8080
