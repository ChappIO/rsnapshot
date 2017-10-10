FROM ubuntu

# The path to your rsnapshot configuration. I don't see why you'd change this
ENV RSNAPSHOT_CONF "/config/rsnapshot.conf"

# Install rsnapshot
RUN apt-get update && apt-get install -y rsnapshot

# We work in the root home
WORKDIR /root

# This volume contains the rsnapshot configuration
VOLUME /config

# This volume contains the snapshots
VOLUME /snapshots

# Install custom scripts
ADD entrypoint.sh entrypoint.sh
ADD rsnapshot.conf.default rsnapshot.conf.default

ENTRYPOINT ["./entrypoint.sh"]
