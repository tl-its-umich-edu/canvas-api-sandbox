#!/usr/bin/env bash

## Demonstration of access to per student data in the UM ESB.

## The authorization supplied here is for accessing the UM ESB.  Authorization to use the
## external system from the ESB will vary on a system by system basis.

## Read in shared application token information.  The argument specifies
## the particular configuration to use.

#source ./token.config QA_TL_HACKATHON_10_2014
#source ./token.config TokenRenewalTest
source ./token.config SD-QA

set -x

# requests

# These are the requests available for both student dashboard and student records
#/Students/{uniqname}/Terms
#/Students/{uniqname}/Terms/{term}/Schedule


# http://mywiki.wooledge.org/BashFAQ/050 contains hints on how to write
# function that will successfully pass args on to a shell command.

### Get all variants for a student in a particular term.
function getTermsAll {
    set +x
    ## student
    local u=$1
    ## term
    local t=$2
    echo "+++++++ STUDENT: $u"

#    CURL_OPTIONS=" -k "
#    CURL_OPTIONS=" --trace-ascii - "
    HOST=https://woodpigeon.dsc.umich.edu:8243

    #HOST=http://api-gw.it.umich.edu
    #HOST=http://woodpigeon.dsc.umich.edu:8280

    local URL_SD=$HOST/StudentDashboard/v1/Students/$u/Terms
    local URL_SD_SCHEDULE=$HOST/StudentDashboard/v1/Students/$u/Terms/$t/Schedule

    local URL_SR=$HOST/StudentRecords/v1/Students/$u/Terms
    local URL_SR_SCHEDULE=$HOST/StudentRecords/v1/Students/$u/Terms/$t/Schedule
    
    set +x
 echo " "
  echo "+++++ SD TERMS"
  echo curl  $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SD
  curl  $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SD

 echo " "
 echo "++++ SD SCHEDULE"
 echo curl  $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SD_SCHEDULE
 curl  $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SD_SCHEDULE
 set +x
 echo " "

#    echo " "
#    echo "++++ SR TERMS"
#    echo curl  $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SR
#    curl  $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SR
#    set +x
#    echo " "

    # echo " "
    # echo "++++ SR SCHEDULE"
    # echo curl  $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SR_SCHEDULE
    # curl  $CURL_OPTIONS -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SR_SCHEDULE
    set +x
    echo " "
}

set +x

## make sure it is an unknown uniqname
#UNIQNAME=$UNIQNAME.XXX

getTermsAll $UNIQNAME 2010

#end
