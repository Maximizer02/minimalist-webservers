#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/sendfile.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/stat.h>

void error(char *message){
        printf("%s\n\n", message);
        printf("Exit Code: %d\n", errno);
        exit(errno);
}

int create_socket(){
        printf("Creating Socket...\n");
        int sock = socket(AF_INET, SOCK_STREAM, 0);
        if(sock == -1) error("Error creating Socket!");
        return sock;
}

void bind_socket(int socket_fd){
        struct sockaddr_in address;
        address.sin_family = AF_INET;
        address.sin_addr.s_addr = htonl(INADDR_ANY);
        address.sin_port = htons(8080);
        
        printf("Binding Socket...\n");
        if(bind(socket_fd, (struct sockaddr *) &address, sizeof(address)) == -1)
            error("Error binding Socket!");
}

void listen_socket(int socket_fd){
        printf("Listening on Socket...\n");
        if(listen(socket_fd, 10) == -1)
            error("Error listening on Socket!");
}

void accept_connection(int socket_fd){
        printf("Accepting Connection...\n");
        int connection_fd = accept(socket_fd, 0, 0);
        if(connection_fd == -1)    
            error("Error accepting connection!");

        char buffer[1024];
        read(connection_fd, buffer, sizeof(buffer));
        printf("%s\n", buffer);
 
        char response[] = "HTTP/1.1 200 OK\r\ncontent-type: text/html\r\n\r\n";
        write(connection_fd, response, strlen(response));
        int html_fd = open("index.html", O_RDONLY);
        struct stat st;
        fstat(html_fd, &st);
        int html_count = st.st_size;
        sendfile(connection_fd, html_fd, NULL, html_count);
        close(connection_fd);
		close(html_fd);
}

int main(){
        if(access("index.html", F_OK) != 0)
            error("No index.html file found!");
        int socket_fd = create_socket();
        bind_socket(socket_fd);
        listen_socket(socket_fd);
        while(1)
            accept_connection(socket_fd);
        close(socket_fd);
        return 0;
}
