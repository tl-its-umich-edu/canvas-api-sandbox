#!/usr/bin/env ruby

require "json"

load "user_info.rb"

COURSE_ID=217

REQUEST="/api/v1/courses/#{COURSE_ID}/search_users?enrollment_type=teacher"
#REQUEST="/api/v1/courses/#{COURSE_ID}"

# Web Service call

URL="curl -H \"Authorization: Bearer #{TOKEN}\" #{HOST}/#{REQUEST}"
print "url: #{URL}"
json_data=`#{URL}`


json_parsed = JSON.parse(json_data)

puts "#{json_parsed}"

json_parsed.each { |x| 
    puts "---------"
    x.each do |key, array|
       puts "\t#{key} value: #{array}"
    end
}

#end

