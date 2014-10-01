#!/usr/bin/env ruby

require "json"
require "rest-client"
require "logger"

load "user_info.rb"
load "request_utils.rb"

#uniqname="jwille"
uniqname="jorhill"
term="2010"
do_request("Students/#{uniqname}/Terms/#{term}/Schedule")
#end

