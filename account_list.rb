#!/usr/bin/env ruby

# List accounts current user can manage. This only works for 
# account 1

require "json"

load "user_info.rb"

REQUEST="/api/v1/accounts/1"

#TOKEN, HOST = USE_INFO["token"], USE_INFO["host"]

# Web Service call

URL="curl -H \"Authorization: Bearer #{TOKEN}\" #{HOST}/#{REQUEST}"
print "url: #{URL}"
json_data=`#{URL}`

#print "#{json_data}\n"
parsed = JSON.parse(json_data)

print "#{parsed}"

print "\n";
#end

