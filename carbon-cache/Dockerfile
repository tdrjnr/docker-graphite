#
#
# Graphite and centos 7 image
# June 14, Tuesday 2016
# Hiu, Yen Onn <yenonn@gmail.com>
FROM centos:latest
MAINTAINER Yenonn Hiu <yenonn@gmail.com>

USER root

# installation
RUN yum -y install epel-release
RUN yum -y install python-pip 
RUN yum -y install python-devel gcc libev libev-devel pycairo rrdtool-python net-tools

RUN yum -y install python-setuptools && easy_install supervisor

RUN pip install --upgrade pip

RUN pip install carbon whisper twisted==16.2.0

RUN cp /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf

RUN cp /opt/graphite/conf/storage-schemas.conf.example /opt/graphite/conf/storage-schemas.conf

RUN cp /opt/graphite/conf/storage-aggregation.conf.example /opt/graphite/conf/storage-aggregation.conf

# setting up supervisord
ADD supervisord.conf /etc

# setting up the wrapper script to customize the incoming carbon port
ADD start_carbon.sh /usr/bin/

# start carbon
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
