FROM debian:stable-slim
ENV DEBIAN_FRONTEND noninteractive

# Update sources and install necessary packages
RUN echo "deb http://deb.debian.org/debian stable main" > /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian stable-updates main" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian-security stable-security main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
    curl \
    jq \
    make \
    git \
    python3-pygments \
    gnuplot \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    imagemagick && \
    rm -rf /var/lib/apt/lists/*

# Configure ImageMagick to allow PDF processing
RUN mkdir -p /etc/ImageMagick-6 && \
    echo '<?xml version="1.0" encoding="UTF-8"?>' > /etc/ImageMagick-6/policy.xml && \
    echo '<policy domain="coder" rights="read|write" pattern="PDF" />' >> /etc/ImageMagick-6/policy.xml

WORKDIR /data
VOLUME ["/data"]
