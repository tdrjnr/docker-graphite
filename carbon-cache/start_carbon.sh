#!/bin/bash

if ! pgrep python &>/dev/null
then
	if [ ! -z $CARBON_PORT ]
	then
		sed -e "s|2003|$CARBON_PORT|g" /opt/graphite/conf/carbon.conf.example > /opt/graphite/conf/carbon.conf
	fi
	python /opt/graphite/bin/carbon-cache.py start
fi
