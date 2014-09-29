#!/usr/bin/env ruby

# List terms for UM 

require "json"
require "rest-client"
require "logger"

load "user_info.rb"

REQUEST="Terms"

# Web Service call

URL="#{HOST}/#{REQUEST}"

log = Logger.new(STDOUT)
log.level = Logger::DEBUG
RestClient.log = log

response = RestClient.get URL, { :Authorization =>"Bearer #{TOKEN}",
                                 :accept => :json,
                                 :verify_ssl => OpenSSL::SSL::VERIFY_NONE}
puts response.body
json_data = response.body

parsed = JSON.parse(json_data)

print "#{parsed}"

print "\n";
#end

