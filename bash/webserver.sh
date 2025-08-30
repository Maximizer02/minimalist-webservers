#! /bin/bash

# exit if no servable html is found
if [ ! -f "index.html" ] ; then
		echo "no index.html file found";
		exit 1;
fi

enable accept;
while true
do
		# establish tcp connection
		accept -b 0.0.0.0 -v tcp 8080;
		while read -u $tcp -r line
		do
				echo $line;
				# read until blank line
				if [ "$line" = $'\r' ] ; then
						break;
				fi;    
		done;
		
		# transmit header
		echo -e "HTTP/1.1 200 OK\r\ncontent-type: text/html\r\n\r\n" >&"$tcp";

		# transmit content
		while read -r line
		do
				echo "$line" >&"$tcp";
		done < "index.html";

		# close connection
		exec {tcp}>&-;
done;

