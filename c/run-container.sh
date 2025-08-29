#! /bin/bash
docker run -p 6901:8080 --name mws-c -d mws-c

if [ $? != 0 ] ; then
	echo "Failed to run container :("
	exit $?;
fi

echo "Webserver available at http://localhost:6901"
