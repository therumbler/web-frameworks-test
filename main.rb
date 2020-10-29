require 'socket'
server = TCPServer.new '0.0.0.0', 8000


def _response(session)
  body = '{"message": "Hello World"}'
  # puts 'body is', body
  session.puts <<-HEREDOC
HTTP/1.1 200 OK
Content-Type: application/json

#{body}
HEREDOC
end

def _get_request(session)
  request_string = ""
  while (request = session.gets) && (request.chomp.length > 0)
    puts "They said \"#{request.chomp}\"" # the server logs each response
  end
  puts "finished reading"
end

loop do
  session = server.accept

  _get_request(session)
  _response(session)
  session.close
end