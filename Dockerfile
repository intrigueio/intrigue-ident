FROM debian:buster-20190812-slim


ENV CHROME_BIN=/usr/bin/chromium \
    CHROME_PATH=/usr/lib/chromium/ \
    GEM_HOME="/home/ident/.gem"



RUN adduser --disabled-password --gecos "" ident \
    && apt-get update \
    && apt-get install -yq build-essential chromium chromium-driver curl gcc \
       libbison-dev libcurl4-openssl-dev libgdbm-compat-dev libgdbm-dev \
       libharfbuzz-dev libssl-dev libxml2-dev libxslt1-dev openssl \
       readline-common xvfb  zlib1g-dev zlib1g \
    && mkdir -p /src/ruby  \
    && cd /src/ruby \
    && curl -O https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.3.tar.gz \
    && tar -xvzf ruby-2.6.3.tar.gz \
    && cd ruby-2.6.3 \
    && ./configure --disable-install-rdoc \
    && make && make install \
    && rm -rf /var/cache/apt/* \
    && cd / \
    && rm -rf /src/ruby/  \
       /usr/local/share/{doc,man} \
    && apt-get remove -yq gcc build-essential \
    && apt-get autoremove  -yq \
    && bundle config build.nokogiri --use-system-libraries 

ADD . /home/ident
RUN chown -R ident:ident /home/ident
USER ident
WORKDIR /home/ident
RUN gem install bundler \
    && bundle install
ENTRYPOINT ["/home/ident/util/docker.sh"]
