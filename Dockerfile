# Dockerfile

FROM ruby:2.3

# Install nodejs
RUN apt-get update -qq && apt-get install -y nodejs

# Add Yarn repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Update
# Install Yarn
RUN apt-get install yarn -y

ADD ./ /usr/src/app
WORKDIR /usr/src/app

# Install & run bundler
RUN gem install bundler -v 1.11.2
RUN gem install json -v '1.8.3' --source 'https://rubygems.org/'
RUN gem install sprockets -v '3.5.2' --source 'https://rubygems.org/'
RUN bundle

CMD bundle exec rails s

