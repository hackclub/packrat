FROM rails:4.2.4
MAINTAINER Zach Latta <zach@hackclub.io>

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install -j4 --system

COPY . /usr/src/app/

RUN bundle exec rake assets:precompile

EXPOSE 8080

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
