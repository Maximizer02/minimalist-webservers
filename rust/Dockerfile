FROM alpine:latest AS build
RUN apk add rustc-dev
RUN mkdir /build
WORKDIR /build
COPY webserver.rs .
RUN rustc -o webserver webserver.rs

FROM alpine:latest AS run
RUN apk add libgcc
RUN mkdir /app
WORKDIR /app
COPY --from=build /build/webserver .
EXPOSE 8080
ENTRYPOINT ["./webserver"]
