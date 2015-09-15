FROM ruby:2.2-onbuild

# Copy the Gemfile and Gemfile.lock into the image. 
# Temporarily set the working directory to where they are. 
WORKDIR /tmp 
ADD $PWD/Gemfile Gemfile
ADD $PWD/Gemfile.lock Gemfile.lock
RUN bundle install 

# Set up our db
RUN rake db:migrate
RUN rake db:seed