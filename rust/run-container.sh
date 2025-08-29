#! /bin/bash
docker run -p 6902:8080 --name mws-rust -d mws-rust

if [ $? != 0 ] ; then
	echo "Failed to run container :("
	exit $?;
fi

echo "Webserver available at http://localhost:6902"
