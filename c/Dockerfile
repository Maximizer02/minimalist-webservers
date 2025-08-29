FROM alpine:latest AS build
RUN apk add --no-cache gcc musl-dev

RUN mkdir /build
WORKDIR /build
COPY webserver.c . 
RUN gcc -o webserver webserver.c


FROM alpine:latest AS run
RUN mkdir /app

WORKDIR /app
COPY --from=build /build/webserver .
EXPOSE 8080
ENTRYPOINT ["./webserver"]
