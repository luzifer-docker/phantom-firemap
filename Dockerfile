FROM nolimitid/node-phantom

RUN set -ex \
 && apt-get update \
 && apt-get install -y imagemagick

VOLUME ["/data"]
ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD []

ADD index.js /src/index.js
ADD run.sh /usr/local/bin/run.sh
