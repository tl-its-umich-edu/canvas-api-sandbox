#!/usr/bin/env bash

## This is a simple demonstration the use of the UM ESB / API to access external apis.

## The token authorization supplied here is for access to the ESB.  Additional uthorization
## that may be required for the external systems will vary on a system by system basis and may
## well involve ESB configuration.

## Read in token configuration information.
source ./token.config StudentDashboardDev

#CURL_OPTIONS=" -k "

set +x

## call to UM schedule of classes
#curl -k -H "Authorization: Bearer $ACCESS_TOKEN" https://api-gw.it.umich.edu/Curriculum/SOC/v1/Terms

echo " "

## call to Canvas production
#curl -k -H "Authorization: Bearer $ACCESS_TOKEN" https://api-gw.it.umich.edu/Canvas/Admin/v1//accounts/1/users

echo " "

### For DEV ESB application
source ./token.config StudentDashboardDevDLH
#UNIQNAME set in token.config
curl $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" https://woodpigeon.dsc.umich.edu:8243/StudentDashboard/v1/Students/$UNIQNAME/Terms

echo " "

#end
