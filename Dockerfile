FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh \
    && apt update -qq \
    && apt install -y build-essential \
    libpq-dev \
    libmagickwand-dev \
    && bash nodesource_setup.sh \
    && apt install -y nodejs \
    && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update \
    && apt install yarn

RUN groupadd --gid 1000 app \
  && useradd --uid 1000 --gid app --shell /bin/bash --create-home app

USER app
