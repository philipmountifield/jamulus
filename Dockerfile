FROM alpine:3.11 as build

RUN apk update

RUN apk add --no-cache build-base qt5-qtbase-dev qt5-qttools-dev qtchooser

WORKDIR /tmp/build
COPY . /tmp/build

RUN qmake "CONFIG+=nosound headless" Jamulus.pro && \
    make clean && \
    make

FROM alpine:3.11

RUN apk update

RUN apk add --no-cache qt5-qtbase-x11 icu-libs

COPY --from=build /tmp/build/Jamulus /usr/local/bin/Jamulus

EXPOSE 22124/udp

ENTRYPOINT ["Jamulus", "--server", "--nogui", "--fastupdate", "--numchannels", "20"]
