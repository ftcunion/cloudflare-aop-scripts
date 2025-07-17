#!/bin/bash
source ./CONFIG

echo "Please enter the certificate ID to get the status:"
read -r CERTID

curl --silent \
  "https://api.cloudflare.com/client/v4/zones/$ZONEID/origin_tls_client_auth/$CERTID" \
  --header "X-Auth-Email: $MYAUTHEMAIL" \
  --header "X-Auth-Key: $MYAUTHKEY"
