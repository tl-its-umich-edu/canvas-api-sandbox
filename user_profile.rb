#!/usr/bin/env ruby

require "json"

load "user_info.rb"

UNIQNAME="FLICKA"

REQUEST="/api/v1/users/sis_login_id:#{UNIQNAME}/profile.json"

# Web Service call

URL="curl -H \"Authorization: Bearer #{TOKEN}\" #{HOST}/#{REQUEST}"
print "url: #{URL}"
json_data=`#{URL}`


json_parsed = JSON.parse(json_data)

json_parsed.each { |x| 
#    puts x
    puts "---------"
    x.each do |key, array|
       puts "\t#{key} value: #{array}"
    end
}

#print "#{json_data}\n"

#does not return valid json

#parsed = JSON.parse(json_data)
#pp = JSON.pretty_generate("{#{json_data}}")


#print "#{parsed}"
#print #{pp}

print "\n";
#end

