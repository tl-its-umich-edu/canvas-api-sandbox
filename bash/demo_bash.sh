#!/usr/bin/env bash
## This is a simple demonstration the use of the UM ESB / API to access externals systems.

## The authorization supplied here is for accessing the UM ESB.  Authorization to use the
## external system from the ESB will vary on a system by system basis.

## Read in shared application token
source ./token.config

set -x

## call to UM schedule of classes
curl -k -H "Authorization: Bearer $TOKEN" https://api-gw.it.umich.edu/Curriculum/SOC/v1/Terms

## call to Canvas production
curl -k -H "Authorization: Bearer $TOKEN" https://api-gw.it.umich.edu/Canvas/Admin/v1//accounts/1/users

#end
