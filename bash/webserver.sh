#! /bin/bash

enable accept;

while true
do
		accept -b 127.0.0.1 -v file 8080;
		while read -u $file -r line
		do
				echo $line;
				if [ "$line" = $'\r' ] ; then
						break;
				fi;    
		done;
		echo -e "HTTP/1.1 200 OK\r\ncontent-type: text/html\r\n\r\n<h1>Hello from Bash!</h1>\r\n" >&"$file";
		exec {file}>&-;
done;
