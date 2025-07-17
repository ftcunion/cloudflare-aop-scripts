#!/bin/bash
source ./CONFIG

echo "Please enter the certificate ID to enable:"
read -r CERTID

request_body=$(< <(
  cat <<EOF
{
  "config" : [
    {
      "cert_id": "$CERTID",
      "enabled": true,
      "hostname": "$HOSTNAME"
    }
  ]
}
EOF
))
curl --silent \
  "https://api.cloudflare.com/client/v4/zones/$ZONEID/origin_tls_client_auth/hostnames" \
  -X PUT \
  --header "Content-Type: application/json" \
  --header "X-Auth-Email: $MYAUTHEMAIL" \
  --header "X-Auth-Key: $MYAUTHKEY" \
  --data "$request_body"
