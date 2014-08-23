#!/usr/bin/env ruby

require "json"

load "user_info.rb"

UNIQNAME="FLICKA"
### make it easy to switch between different methods of identifying the user (object) to find.
USER_STRING="sis_login_id:#{UNIQNAME}"

# works without specifying user
REQUEST="/api/v1/courses.json"
#REQUEST="/api/v1/courses.json?as_user_id=#{USER_STRING}" 

# Web Service call

URL="curl -H \"Authorization: Bearer #{TOKEN}\" #{HOST}/#{REQUEST}"
print "url: #{URL}"
json_data=`#{URL}`


puts json_data

json_parsed = JSON.parse(json_data)

json_parsed.each { |x| 
#    puts x
    puts "---------"
    x.each do |key, array|
       puts "\t#{key} value: #{array}"
    end
}
#print "#{json_data}\n"

#end

