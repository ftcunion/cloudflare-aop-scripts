#!/bin/bash
source ./CONFIG

MYCERT="$(cat cert.crt | perl -pe 's/\r?\n/\\n/' | sed -e 's/..$//')"
MYKEY="$(cat cert.key | perl -pe 's/\r?\n/\\n/' | sed -e's/..$//')"

request_body=$(< <(
  cat <<EOF
{
  "certificate": "$MYCERT",
  "private_key": "$MYKEY"
}
EOF
))
curl --silent \
  "https://api.cloudflare.com/client/v4/zones/$ZONEID/origin_tls_client_auth" \
  --header "Content-Type: application/json" \
  --header "X-Auth-Email: $MYAUTHEMAIL" \
  --header "X-Auth-Key: $MYAUTHKEY" \
  --data "$request_body"
