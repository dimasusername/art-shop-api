FROM ruby:2.6.5

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app
# the running version of Bundler (1.17.2) is older than the version that created the lockfile (1.17.3)
RUN gem install bundler -v 1.17.3

COPY src/Gemfile src/Gemfile.lock ./
RUN bundle install

COPY src/ .