FROM node:18-alpine

RUN \
    npm install -g wrangler

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
