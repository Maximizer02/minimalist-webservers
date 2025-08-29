#! /bin/bash
docker run -p 6900:8080 --name mws-bash -d mws-bash

if [ $? != 0 ] ; then
	echo "Failed to run container :("
	exit $?;
fi

echo "Webserver available at http://localhost:6900"
