###
### https://github.com/GoogleChrome/puppeteer/issues/3019
###

# Ref: https://github.com/gliderlabs/docker-alpine/issues/53
FROM ruby:2.6.0-alpine

RUN apk add --update \
build-base \
libxml2-dev \
libxslt-dev \
postgresql-dev \
xvfb \
harfbuzz \
chromium-chromedriver \
&& rm -rf /var/cache/apk/*

# Use libxml2, libxslt a packages from alpine for building nokogiri
RUN bundle config build.nokogiri --use-system-libraries

ADD . /ident

# Installs latest Chromium package.
#RUN apk update && apk upgrade \
#    && echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
#    && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
#    && apk add --no-cache \
#    chromium@edge \
#    nss@edge \
#    && rm -rf /var/lib/apt/lists/* \
#    /var/cache/apk/* \
#    /usr/share/man \
#    /tmp/*
RUN apk update && apk upgrade && \
    echo @edge http://nl.alpinelinux.org/alpine/v3.8/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/v3.8/main >> /etc/apk/repositories && \
    apk add --no-cache \
      chromium \
      nss

# Install chromedriver
# Get chromedriver
#RUN  mkdir /chromedriver
#WORKDIR /chromedriver
#RUN CHROMEDRIVER_VERSION=`wget -q -O - "http://chromedriver.storage.googleapis.com/LATEST_RELEASE"` \
#  && wget -q "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
#  && unzip chromedriver_linux64.zip \
#  && chmod +x chromedriver \
#  && rm chromedriver_linux64.zip \
#  && cp chromedriver /usr/bin/


# Add Chrome as a user
#RUN mkdir -p /usr/src/app \
#    && adduser -D chrome \
#    && chown -R chrome:chrome /usr/src/app

# Run Chrome as non-privileged
#USER chrome

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# install ruby deps
WORKDIR /ident
RUN gem install bundler
RUN bundle install

ENTRYPOINT ["/ident/util/docker.sh"]

