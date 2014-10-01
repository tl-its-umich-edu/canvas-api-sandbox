#!/usr/bin/env ruby

require "json"
require "rest-client"
require "logger"

load "user_info.rb"
load "request_utils.rb"

#uniqname="jwille"
uniqname="jorhill"
do_request("Students/#{uniqname}/Terms")
#end

