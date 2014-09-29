#!/usr/bin/env ruby

require "json"

load "user_info.rb"

API="https://umich.beta.instructure.com/api/v1"
REQUEST="accounts/1/sis_imports.json?import_type=instructure_csv"

# Web Service call
#json_data=`curl -H "Content-Type: application/zip" --data-binary @mpathway.zip -H "Authorization: Bearer GRIZZLY" https://umich.beta.instructure.com/api/v1/accounts/1/sis_imports.json?import_type=instructure_csv`
json_data=`curl -H "Content-Type: application/zip" --data-binary @mpathway.zip -H "Authorization: Bearer #{TOKEN}" ${API}/#{REQUEST}`

print "#{json_data}\n"
parsed = JSON.parse(json_data)

job_id=parsed["id"]

print "the job id is: #{job_id}\n"

print "here is the job #{job_id} status: \n"

begin
	#sleep every 10 sec, before checking the status again
	sleep(10);

	json_result=`curl 'https://umich.beta.instructure.com/api/v1/accounts/1/sis_imports/#{job_id}' -H "Authorization: Bearer GRIZZLY"`

	#print out the whole json result
	print "#{json_result}\n"

	#parse the status percentage
	parsed_result=JSON.parse(json_result)
	job_progress=parsed_result["progress"]

	print "processed #{job_progress}"

end until job_progress == 100
