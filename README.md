# Ruby:1.9.3 + ffmpeg Dockerfile

This repository contains a Dockerfile of Ruby, ffmpeg for Docker's automated build published to the public Docker Hub Registry.

## What's included
- Ruby 1.9.3
- ffmpeg n2.4.2

### Installation
1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/sub2u/ruby1.9.3-ffmpeg/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull sub2u/ruby1.9.3-ffmpeg:latest`

   (alternatively, you can build an image from Dockerfile: `docker build -t="sub2u/ruby1.9.3-ffmpeg" github.com/sub2u/ruby1.9.3-ffmpeg`)


### Usage

    docker run -it --rm sub2u/ruby1.9.3-ffmpeg

