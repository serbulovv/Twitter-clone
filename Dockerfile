FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client && rm -rf /var/cache/apk/*

RUN mkdir -p /app
WORKDIR /app
COPY . .

RUN bundle install

EXPOSE 3000