#!/bin/sh

grep "streamdev-client.RemoteIp = auto" /etc/vdr/setup.conf
if [ $? != 0 ]
then
        echo streamdev server was already set
        exit
else
        echo autodetect Streamdev server
fi

COUNTER=1
#IP=`ifconfig eth0 | grep "inet Adr" | awk -F: '{print $2}' | awk '{print $1}' | cut -d"." -f 1-3`
IP=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | cut -d"." -f 1-3`
PORT=2004

#set -x

while [ $COUNTER -lt 254 ]
do
  echo "test $IP.$COUNTER"
  ping -c 1 -W 1 $IP.$COUNTER > /dev/null
  if [ $? -eq 0 ]
  then
    echo found ip $IP.$COUNTER
    echo quit | nc $IP.$COUNTER $PORT
    if [ $? -eq 0 ]
    then
      echo found running streamdev-server on $IP.$COUNTER
      sed -i "s/streamdev-client.RemoteIp = auto/streamdev-client.RemoteIp = $IP.$COUNTER/g" /etc/vdr/setup.conf
      sed -i "s/svdrpservice.ServerIp = auto/svdrpservice.ServerIp = $IP.$COUNTER/g" /etc/vdr/setup.conf
      sed -i "s/remotetimers.ServerIp = auto/remotetimers.ServerIp = $IP.$COUNTER/g" /etc/vdr/setup.conf
      exit
    fi
  fi
  COUNTER=$(( $COUNTER + 1 ))
done
