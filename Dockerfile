FROM node:18-alpine

RUN \
    apk add --no-cache git && \
    npm install -g wrangler

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
