FROM alpine:latest
RUN apk add bash bash-dev

RUN mkdir /app
COPY webserver.sh /app
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["bash", "webserver.sh"]
