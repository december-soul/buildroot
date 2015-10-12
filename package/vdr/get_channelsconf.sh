#!/bin/sh

set -x 

if [ -e /etc/vdr/channels.conf ]
then
	echo "channels.conf allready exist. exit"
	exit
else
	STREAMDEV_SERVER_IP=`cat /etc/vdr/setup.conf | grep streamdev-client.RemoteIp | awk -F= '{print $2}'`
	echo "get channel.conf from server $STREAMDEV_SERVER_IP"
	#backup old channels.conf
	mv /etc/vdr/channels.conf /etc/vdr/channels_`date +%Y%m%d_%H%M`.conf
	echo -e "LSTC\nQUIT" | nc $STREAMDEV_SERVER_IP 6419 2>/dev/null | dos2unix | grep "^250" | cut -d " " -f2- > /etc/vdr/channels.conf
fi

