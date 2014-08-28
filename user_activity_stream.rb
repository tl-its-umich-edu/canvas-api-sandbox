#!/usr/bin/env ruby

require "json"

load "user_info.rb"

REQUEST="/users/self/activity_stream"

# Web Service call

URL="curl -H \"Authorization: Bearer #{TOKEN}\" #{HOST}/#{REQUEST}"
print "url: #{URL}"
json_data=`#{URL}`

print "#{json_data}\n"
parsed = JSON.parse(json_data)

print "#{parsed}"

print "\n";
#end

