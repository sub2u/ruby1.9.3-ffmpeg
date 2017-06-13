FROM ruby:1.9.3
MAINTAINER Subbu <subbarao.kly@gmail.com>

RUN apt-get update && \
    apt-get install -y \
    nasm \
    libmp3lame-dev \
    libtheora-dev \
    libvorbis-dev \
    libvpx-dev \
    libx264-dev \
    libfreetype6-dev \
    libass-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install ffmpeg
ENV FFMPEG_TAG n2.4.2
RUN cd /tmp && \
    git clone --depth 1 --branch $FFMPEG_TAG  git://source.ffmpeg.org/ffmpeg && \
    cd ffmpeg && \
    ./configure --prefix=$INSTALL_DIR \
      --extra-cflags="-I${INSTALL_DIR}/include" \
      --extra-ldflags="-L${INSTALL_DIR}/lib" \
      --extra-libs="-ldl" \
      --enable-gpl \
      --enable-libass \
      # --enable-libfdk-aac \
      --enable-libmp3lame \
      --enable-libtheora \
      --enable-libvorbis \
      --enable-libvpx \
      --enable-libx264 \
      --enable-libfreetype \
      --enable-shared \
      --enable-nonfree && \
    make && \
    make install && \
    cd /tmp && \
    rm -rf ffmpeg
    
