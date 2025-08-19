FROM alpine:latest
RUN apk add --no-cache gcc musl-dev

RUN mkdir /app
COPY webserver.c /app
WORKDIR /app
RUN gcc -o webserver webserver.c
EXPOSE 8080
ENTRYPOINT ["./webserver"]
