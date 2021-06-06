FROM node:14-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN npm install serve -g

WORKDIR /usr/app
COPY package.json .
RUN npm install

COPY . .

ARG BASE_URL
RUN npm run build

CMD ["serve", "dist/mf6-statistics", "-l", "80"]
