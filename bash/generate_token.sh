#!/bin/bash

## prod tl hackathon
#source ./token.config PROD_TL_HACKATHON
#source ./token.config StudentDashboardDevDLH
#source ./token.config StudentDashboardDev
#source ./token.config TL_HACKATHON_QA_ESB
#source ./token.config QA_TL_HACKATHON_10_2014
#source ./token.config QA_TL_HACKATHON_10_2014
source ./token.config TokenRenewalTest

set -x

# Obtain your consumer key and consumer secret from the API Directory. These are generated on the Subscriptions page after an application is successfully subscribed an API.

# Combine the consumer key and consumer secret keys in the format: consumer-key:consumer-secret.  Encode the combined string using base64. Most programming languages have a method to base64 encode a string. For an example of encoding to base64.  Visit the base64encode site for more information.

KEY_SECRET="$CONSUMER_KEY:$CONSUMER_SECRET"
echo "KS: $KEY_SECRET"
#B64=$(echo $KEY_SECRET | base64 --wrap=0 -)
B64=$(echo $KEY_SECRET | base64  -)
echo "B64: [$B64]"


# Execute a POST call to the token API to get an access token.

# non-working example
# curl -k -d "grant_type=client_credentials&scope=PRODUCTION" -H "Authorization :Basic Naahhaan, Content-Type: application/x-www-form-urlencoded" https://api-km.it.umich.edu/token


curl -v -k -d "grant_type=client_credentials&scope=PRODUCTION" -H "Authorization: Basic $B64, Content-Type: application/x-www-form-urlencoded" $TOKEN_SERVER
# Below is a sample response to the token API call:
# {"token_type":"bearer","expires_in":3600,"access_token":"minenotyours"}

echo " "

#end
