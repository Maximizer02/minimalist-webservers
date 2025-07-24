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
        fi
    done;
    text=$(cat webserver.sh)
    text="${text//</\&lt;}"
    text="${text//>/\&gt;}"
    echo "HTTP/1.1 200 OK" >&"$file";
    echo "content-type: text/html" >&"$file";
    echo $'\r' >&"$file";
    echo "<h1>Hello World!</h1>" >&"$file";
    echo "<hr>" >&"$file";
    echo "<p>This conent is being served by a webserver written in pure bash!" >&"$file";
    echo "It makes use of bash's loadable 'accept' builtin that allows you to connect to a TCP socket.</p>" >&"$file";
    echo "<h3>This is the code:</h3>" >&"$file";
    echo "<pre><code>$text</code></pre>" >&"$file";
    echo '<p style="color:red;">Have fun!</p>' >&"$file";

    exec {file}>&-
done;
