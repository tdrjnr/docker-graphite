#
#
# Graphite and centos 7 image
# June 10, Friday 2016
# Hiu, Yen Onn <yenonn@gmail.com>
FROM centos:latest
MAINTAINER Yenonn Hiu <yenonn@gmail.com>

USER root
ENV HTTP_HOME /etc/httpd/conf.d/
ENV GRAPHITE_HOME /opt/graphite/

# installation
RUN yum -y install epel-release
RUN yum -y install python-pip 
RUN yum -y install python-devel gcc libev libev-devel pycairo rrdtool-python mod_wsgi git httpd

RUN yum -y install python-setuptools && easy_install supervisor

RUN pip install --upgrade pip

RUN pip install django==1.8.13 carbon whisper graphite-web django-tagging==0.4.3 pytz==2016.4 twisted==16.2.0

RUN cp /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf

RUN cp /opt/graphite/conf/graphite.wsgi.example /opt/graphite/conf/graphite.wsgi

RUN cp /opt/graphite/conf/storage-schemas.conf.example /opt/graphite/conf/storage-schemas.conf

RUN cp /opt/graphite/conf/storage-aggregation.conf.example /opt/graphite/conf/storage-aggregation.conf

# setting up supervisord
ADD supervisord.conf /etc

# add files
RUN rm -fr $HTTP_HOME/*.conf
ADD graphite-vhost.conf $HTTP_HOME
ADD httpd.conf $HTTP_HOME/../conf/
ADD 10-wsgi.conf $HTTP_HOME/../conf.modules.d/
ADD local_settings.py $GRAPHITE_HOME/webapp/graphite/

# configure django
RUN echo "no" | python /opt/graphite/webapp/graphite/manage.py syncdb
RUN chmod -R 777 /opt/graphite/storage

# expose port
EXPOSE 80

# start httpd
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
 
