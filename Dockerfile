FROM ruby:1.9.3
MAINTAINER Subbu <subbarao.kly@gmail.com>


RUN apt-get update && \
    apt-get install -y time yasm nasm \
    automake autoconf  pkg-config libcurl4-openssl-dev \
    libxml2-dev libgtk2.0-dev libglib2.0-dev libevent-dev \
    checkinstall libmp3lame0  libmp3lame-dev openssl \
    libnotify-dev build-essential  libtool intltool \
    libvorbis-dev libtheora-dev libvpx-dev libx264-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /tmp && \
    wget https://www.ffmpeg.org/releases/ffmpeg-3.0.tar.bz2 &&\
    tar jxvf ffmpeg-3.0.tar.bz2 && cd ffmpeg-3.0 && \
    ./configure --enable-openssl --enable-nonfree  --enable-libmp3lame --enable-libvorbis --enable-gpl --enable-libx264 --enable-libtheora --enable-libvpx  --prefix=/usr && time make -j 8 && mkdir /usr/share/ffmpeg && \
    checkinstall --pkgversion=3.0.git -y && dpkg --install ffmpeg_*.deb && \
    cd /tmp && \
    rm -rf ffmpeg-3.0

    
