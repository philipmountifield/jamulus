FROM ubuntu:18.04

WORKDIR /srv/src
COPY . /srv/src/

RUN apt-get update && \
    apt-get install -y build-essential libqt4-dev libjack-jackd2-dev
    
RUN qmake Jamulus.pro && \
    make clean && \
    make
    
EXPOSE 22124/udp
    
CMD ["./Jamulus", "-s", "-n", "-F"]
