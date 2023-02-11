FROM ruby:3.1.2

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
  apt-get install -y build-essential libssl-dev nodejs yarn libpq-dev libsasl2-dev postgresql-client && rm -rf /var/cache/apk/*

RUN mkdir -p /app
WORKDIR /app
COPY . .

COPY package.json yarn.lock ./
RUN yarn install

RUN bundle install

EXPOSE 3000