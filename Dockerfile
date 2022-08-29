FROM ruby:3.0.3

RUN apt-get update -qq && apt-get install -y graphviz

ENV APP /api
RUN mkdir -p $APP
COPY . $APP/

WORKDIR $APP

RUN mkdir -p tmp/sockets && \
    mkdir -p /tmp/public
    # cp -rf $APP/public/* /tmp/public

RUN bundle install
