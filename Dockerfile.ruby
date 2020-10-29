FROM bitnami/ruby
ADD main.rb .
ENTRYPOINT ["ruby", "main.rb"]
# CMD "main.rb"