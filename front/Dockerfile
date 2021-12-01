FROM node:12.18.3-alpine

ENV APP_HOME /ideaFrameworks
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN apk update && npm install -g @vue/cli

# ビルド後に docker-compose run front sh を実行し
# vueをインストール

COPY package.json .
RUN npm install