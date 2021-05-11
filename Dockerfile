FROM node:14.16-alpine

# Install Chrome and tini
USER root
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories \
    && apk upgrade -U -a \
    && apk add \
    libstdc++ \
    chromium \
    harfbuzz \
    nss \
    freetype \
    ttf-freefont \
    font-noto-emoji \
    wqy-zenhei \
    && apk add --no-cache tini \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

COPY local.conf /etc/fonts/local.conf

# Playwright
ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/ \
    PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# App
RUN mkdir -p /app && chown -R node:node /app
WORKDIR /app
USER node

COPY --chown=node package.json package-lock.json ./
RUN npm i
COPY --chown=node  ./ ./

ENTRYPOINT ["tini", "--"]
CMD [ "node", "index.js" ]