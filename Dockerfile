FROM rails:4.1.1

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install --system

COPY . /usr/src/app

EXPOSE 9292

RUN rake db:migrate db:seed

CMD bundle exec rails s -p 9292 -b 0.0.0.0
