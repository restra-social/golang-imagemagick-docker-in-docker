FROM golang:1.8

RUN apt-get update && apt-get install -y \
    libmagickwand-dev \
    libgraphicsmagick-dev \
    imagemagick \
    graphicsmagick

#install glide
RUN curl https://glide.sh/get | sh

#install docker
ENV DOCKER_VERSION 1.13.1

RUN go get gopkg.in/gographics/imagick.v2/imagick
RUN go build -tags no_pkgconfig gopkg.in/gographics/imagick.v2/imagick

# To build use : RUN GOOS=linux go build -ldflags "-s" -a -installsuffix cgo .

RUN curl https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz | tar -xvz && \
    mv docker/docker /usr/local/bin/docker && \
    chmod +x /usr/local/bin/docker && \
rm -r docker