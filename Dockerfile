FROM ubuntu:18.04

WORKDIR /srv/src
COPY . /srv/src/

RUN apt-get update && \
    apt-get install -y build-essential libqt4-dev
    
RUN qmake "CONFIG+=nosound" Jamulus.pro && \
    make clean && \
    make
    
EXPOSE 22124/udp
    
CMD ["./Jamulus", "-s", "-n", "-F"]
