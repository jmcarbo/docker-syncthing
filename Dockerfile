FROM ubuntu

RUN mkdir -p /etc/confd/{conf.d,templates}
RUN mkdir /data
ADD config.toml /etc/confd/conf.d/config.toml
ADD syncthing.tmpl /etc/confd/templates/syncthing.tmpl

ADD syncthing /bin/syncthing
ADD confd /bin/confd
RUN chmod +x /bin/confd
ADD bootstrap /bin/bootstrap
ADD launch /bin/launch

