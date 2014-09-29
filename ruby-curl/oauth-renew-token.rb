#!/usr/bin/env ruby

require "json"

load "user_info.rb"


REQUEST="/users/sis_login_id:#{UNIQNAME}/profile.json"

# Web Service call

#curl -k -d "grant_type=client_credentials&scope=PRODUCTION" -H "Authorization :Basic <WHATEVER TOKEN>, Content-Type: application/x-www-form-urlencoded" https://api-km.it.umich.edu/token

auth_basic = Base64.encode64("#{consumer-key}:#{consumer-secret}"

INSECURE=" -k "
POST_DATA=" -d \"grant_type=client_credentials&scope=PRODUCTION\" "
HEADERS=" -H \"Authorization :Basic #{auth_basic}, Content-Type: application/x-www-form-urlencoded \" "
HOST=" https://api-km.it.umich.edu/token "

URL="curl #{INSECURE} #{POST_DATA} #{HEADERS} #{HOST}"
print "url: #{URL}"
json_data=`#{URL}`

json_parsed = JSON.parse(json_data)

json_parsed.each { |x| 
    puts "---------"
    x.each do |key, array|
       puts "\t#{key} value: #{array}"
    end
}

print "\n";
#end

