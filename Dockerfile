FROM ruby:3.1.4-alpine as build

WORKDIR /opt/policy-web/

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    tzdata \
    bash \
    vim

ENV EDITOR=vim

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
