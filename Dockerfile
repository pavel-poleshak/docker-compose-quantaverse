FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmagickwand-dev

RUN groupadd --gid 1000 app \
  && useradd --uid 1000 --gid app --shell /bin/bash --create-home app

USER app
