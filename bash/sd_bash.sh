#!/usr/bin/env bash

## Demonstration of access to per student data in the UM ESB.

## The authorization supplied here is for accessing the UM ESB.  Authorization to use the
## external system from the ESB will vary on a system by system basis.

## Read in shared application token information.  The argument specifies
## the particular configuration to use.

source ./token.config SD-QA

set -x

# requests

# These are the requests available for both student dashboard and student records
#/Students/{uniqname}/Terms
#/Students/{uniqname}/Terms/{term}/Schedule


### Get all variants for a student in a particular term.
function getTermsAll {
    set +x
    ## student
    local u=$1
    ## term
    local t=$2
    echo "+++++++ STUDENT: $u"

    HOST=https://woodpigeon.dsc.umich.edu:8243

    local URL_SD=$HOST/StudentDashboard/v1/Students/$u/Terms
    local URL_SR=$HOST/StudentRecords/v1/Students/$u/Terms
    local URL_SD_SCHEDULE=$HOST/StudentDashboard/v1/Students/$u/Terms/$t/Schedule
    local URL_SR_SCHEDULE=$HOST/StudentRecords/v1/Students/$u/Terms/$t/Schedule
    
    set -x
    echo curl  -k -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SD
    curl  -k -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SD
    echo curl  -k -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SR
    curl  -k -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SR
    echo curl  -k -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SD_SCHEDULE
    curl  -k -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SD_SCHEDULE
    echo curl  -k -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SR_SCHEDULE
    curl  -k -H "Authorization: Bearer $ACCESS_TOKEN" $URL_SR_SCHEDULE
    set +x
    echo " "
}

set +x

getTermsAll UNIQNAME 2010

#end
