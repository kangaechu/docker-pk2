FROM ruby:2.3

RUN apt-get update
#RUN apt-get install

RUN git clone https://github.com/kangaechu/p2k.git /home/p2k
WORKDIR /home/p2k
RUN bundle install
COPY config/application.yml config/
COPY config/secrets.yml config/
COPY config/environments/production.rb config/environments/

# install kindlerb
RUN gem install kindlerb
RUN bin/setupkindlerb

ENV RAILS_ENV production
EXPOSE 3000/tcp
CMD bundle exec rails server -p 3000 -b '0.0.0.0'
