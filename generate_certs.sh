#!/bin/bash
echo "Generate a 4096-bit RSA private key, using AES-256 encryption. Enter a passphrase when prompted."
echo "Press enter to continue..."
read -r _
openssl genrsa -aes256 -out rootca.key 4096

echo "Create the CA root certificate. When prompted, fill in the information to be included in the certificate. For the Common Name field, use the domain name as value, not the hostname."
echo "Press enter to continue..."
read -r _
openssl req -x509 -new -nodes -key rootca.key -sha256 -days 9999 -out rootca.crt

echo "Create a Certificate Signing Request (CSR). When prompted, fill in the information to be included in the request. For the Common Name field, use the hostname as value."
echo "Press enter to continue..."
read -r _
openssl req -new -nodes -out cert.csr -newkey rsa:4096 -keyout cert.key

echo "Sign the certificate using the rootca.key and rootca.crt created in previous steps."
echo "Press enter to continue..."
read -r _
echo 'basicConstraints=CA:FALSE' > ./cert.v3.ext
openssl x509 -req -in cert.csr -CA rootca.crt -CAkey rootca.key -CAcreateserial -out cert.crt -days 9999 -sha256 -extfile ./cert.v3.ext
echo "Certificate and key files have been generated."
