FROM alpine:3.9 as build

RUN apk update

RUN apk add --no-cache build-base qt-dev

WORKDIR /tmp/build
COPY . /tmp/build

RUN qmake "CONFIG+=nosound" Jamulus.pro && \
    make clean && \
    make

FROM alpine:3.9

RUN apk update

RUN apk add --no-cache qt-x11 icu-libs

COPY --from=build /tmp/build/Jamulus /usr/local/bin/Jamulus

EXPOSE 22124/udp

ENTRYPOINT ["Jamulus", "--server", "--nogui", "--fastupdate", "--numchannels", "20"]
