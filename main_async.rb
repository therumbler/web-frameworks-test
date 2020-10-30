#!/usr/bin/env ruby

require 'async'
require 'async/http/server'
require 'async/http/client'
require 'async/http/endpoint'
require 'async/http/protocol/response'

endpoint = Async::HTTP::Endpoint.parse('http://0.0.0.0:8080')

app = lambda do |request|
	Protocol::HTTP::Response[200, {}, ['{"message":"Hello World"}']]
end

server = Async::HTTP::Server.new(app, endpoint)
client = Async::HTTP::Client.new(endpoint)
	
Async do |task|
    server.run
	# server_task = task.async do
	# 	server.run
	# end
	
	# response = client.get("/")
	
	# puts response.status
	# puts response.read
	
	# server_task.stop
end