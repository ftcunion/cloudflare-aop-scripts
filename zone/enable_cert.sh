#!/bin/bash
source ./CONFIG

request_body=$(< <(
  cat <<EOF
{
  "enabled": true
}
EOF
))
curl --silent \
  "https://api.cloudflare.com/client/v4/zones/$ZONEID/origin_tls_client_auth/settings" \
  -X PUT \
  --header "Content-Type: application/json" \
  --header "X-Auth-Email: $MYAUTHEMAIL" \
  --header "X-Auth-Key: $MYAUTHKEY" \
  --data "$request_body"
