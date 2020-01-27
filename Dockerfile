FROM node:13-alpine

WORKDIR /app
COPY /app/ /app
RUN apk --no-cache add tar curl
COPY /node-sonos-http-api/ /app
RUN l chown -R node:node /app/static /app/cache && \
  npm install --production && \
  rm -rf /tmp/* /root/.npm

EXPOSE 15005

USER node

CMD npm start
