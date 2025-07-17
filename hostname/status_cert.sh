#!/bin/bash
source ./CONFIG

curl --silent \
  "https://api.cloudflare.com/client/v4/zones/$ZONEID/origin_tls_client_auth/hostnames/$HOSTNAME" \
  --header "X-Auth-Email: $MYAUTHEMAIL" \
  --header "X-Auth-Key: $MYAUTHKEY"
