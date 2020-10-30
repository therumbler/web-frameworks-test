FROM bitnami/ruby

RUN gem install async-http       
COPY *.rb ./
# ENTRYPOINT ["ruby", "main.rb"]
ENTRYPOINT [ "ruby","main_async.rb" ]
# CMD "main.rb"