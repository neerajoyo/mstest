FROM ruby:2.3.7

WORKDIR /app

ENV PORT 3000
ENV BUNDLER_VERSION=2.1.4
EXPOSE $PORT


RUN apt-get update -qq && apt-get install -y nodejs


RUN gem install bundler -v 2.1.4


COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install
COPY . ./

ENTRYPOINT ["./docker-entrypoint.sh"]