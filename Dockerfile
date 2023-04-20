FROM ruby:3.0.3

RUN apt-get update && \
    apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY . .

RUN bundle install

EXPOSE 3000
