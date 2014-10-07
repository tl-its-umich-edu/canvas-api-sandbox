### Utilities to run requests against a REST api

def setup_logger 
  log = Logger.new(STDOUT)
  log.level = Logger::DEBUG
  RestClient.log = log
end

def print_response (response)
  puts response.body
  json_data = response.body
  parsed = JSON.parse(json_data)
  print "#{parsed}"
  print "\n";
end

def run_request(request)
#  request="Terms"
  url="#{HOST}/#{request}"

  response = RestClient.get url, { :Authorization =>"Bearer #{TOKEN}",
                                   :accept => :json,
                                   :verify_ssl => true}
#                                   :verify_ssl => OpenSSL::SSL::VERIFY_NONE}
  return response
end

def do_request(request) 
  setup_logger

  response = run_request request

  print_response response
end

