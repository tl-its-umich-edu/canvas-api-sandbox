#!/usr/bin/env ruby

require "json"

load "user_info.rb"


#UNIQNAME="FLICKA"
### make it easy to switch between different methods of identifying the user (object) to find.
USER_STRING="sis_login_id:#{UNIQNAME}"

 # works
REQUEST="/users/#{USER_STRING}/enrollments.json"

# Web Service call

URL="curl -H \"Authorization: Bearer #{TOKEN}\" #{HOST}/#{REQUEST}"
print "url: #{URL}"
json_data=`#{URL}`

print "#{json_data}\n"

json_parsed = JSON.parse(json_data)

json_parsed.each { |x| 
    puts "---------"
    x.each do |key, array|
       puts "\t#{key} value: #{array}"
    end
}


#end

