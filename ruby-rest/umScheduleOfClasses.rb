#!/usr/bin/env ruby

require "json"
require "rest-client"
require "logger"

load "user_info.rb"
load "request_utils.rb"

do_request("Terms")
#end

