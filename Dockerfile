FROM ruby:3.0.3

RUN apt-get update -qq

ENV APP /api
RUN mkdir -p $APP
COPY . $APP/

WORKDIR $APP

RUN mkdir -p tmp/sockets && \
    mkdir -p /tmp/public && \
    mkdir -p /tmp/pids

RUN bundle install
