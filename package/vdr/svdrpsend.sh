#!/bin/sh

HOST=localhost
PORT=6419
while [ $# != 0 ] ; do
	case $1 in
		-H) HOST=$2
			shift 2
			;;
		-P) PORT=$2
			shift 2
			;;
		-h) ARGS=
			break
			;;
		 *) ARGS=$ARGS" $1"
			shift
			;;
	esac
done

if [ -z "$ARGS" ] ; then
	echo "Usage: $0 [-H HOSTNAME] [-d] command..."
	echo "  -H HOSTNAME        destination hostname or IP (default: localhost)"
	echo "  -P PORT            destination port (default: 6419)"
	exit
fi

echo -e "$ARGS\nQUIT" | nc $HOST $PORT 2>/dev/null
