FROM ruby:2.5.6
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client libssl-dev openssl  libxslt-dev libxml2-dev
RUN rm -rf /var/lib/apt/lists/*
RUN gem install bundler
RUN mkdir /h-l33t
WORKDIR /h-l33t
COPY Gemfile /h-l33t/Gemfile
COPY Gemfile.lock /h-l33t/Gemfile.lock
RUN bundle install
COPY . /h-l33t
