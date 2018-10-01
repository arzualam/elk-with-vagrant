#!/bin/bash

# Modify the  /etc/pki/tls/openssl.cnf file

sudo echo -n "`sed '227 a subjectAltName = IP: "192.168.30.41"' /etc/pki/tls/openssl.cnf`" > /etc/pki/tls/openssl.cnf



# Generate the SSL certificate and private key

cd /etc/pki/tls
sudo openssl req -config /etc/pki/tls/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt
