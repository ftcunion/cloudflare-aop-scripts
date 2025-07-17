#!/bin/bash
source ./CONFIG

echo "Please enter the certificate ID to delete:"
read -r CERTID

curl --silent \
  "https://api.cloudflare.com/client/v4/zones/$ZONEID/origin_tls_client_auth/$CERTID" \
  -X DELETE \
  --header "X-Auth-Email: $MYAUTHEMAIL" \
  --header "X-Auth-Key: $MYAUTHKEY"
