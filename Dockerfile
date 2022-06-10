FROM ruby:2.2.0
RUN apt-get update -qq
RUN apt-get install -y nodejs libmysqlclient-dev
RUN mkdir /pt_4_0_0
WORKDIR /pt_4_0_0
ADD Gemfile /pt_4_0_0/Gemfile
ADD Gemfile.lock /pt_4_0_0/Gemfile.lock
RUN bundle install
