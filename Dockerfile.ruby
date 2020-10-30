FROM bitnami/ruby:2.6.6

# RUN gem install bundler
# RUN apt update

# RUN gem install console -v '1.9.1'
# RUN groupadd -r appgroup && 
RUN mkdir /home/appuser
# RUN useradd -r appuser
# USER appuser

WORKDIR /app

COPY Gemfile* ./
RUN bundle update --bundler
RUN bundle install
COPY *.rb ./
# ENTRYPOINT ["ruby", "main.rb"]
RUN ruby -v
ENTRYPOINT [ "ruby","main_async.rb" ]
# CMD "main.rb"