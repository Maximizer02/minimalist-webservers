FROM alpine:latest
RUN apk add rustc-dev

RUN mkdir /app
COPY webserver.rs /app
WORKDIR /app
RUN rustc -o webserver webserver.rs
EXPOSE 8080
ENTRYPOINT ["./webserver"]
