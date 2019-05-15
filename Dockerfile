FROM debian:buster-slim
MAINTAINER Jonas Zeiger <jz@somnomedics.de>

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Update
RUN apt-get update \
	&& apt-get --no-install-recommends -y install \
		localepurge \
		procps \
		net-tools \
		less \
		lsof \
		htop \
		ca-certificates \
		rsyslog \
		supervisor \
		postfix sasl2-bin postfix-cdb libsasl2-modules opendkim opendkim-tools \
	&& apt-get clean

# Add files
ADD assets/install.sh /opt/install.sh

# Run
CMD /opt/install.sh;/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

