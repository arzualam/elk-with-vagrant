#!/bin/bash

# Modify the /etc/filebeat/filebeat.yml file

sudo echo -n "`sed '28 {s/^/#/}' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '28 a \          - /var/log/secure ' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '29 a \          - /var/log/messages ' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '68 a \     - document_type: syslog ' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '147 {s/^/#/}' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '149 {s/^/#/}' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '159 {s/^#//}' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '159 {s/localhost/192.168.30.41/}' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '163 a \  tls: ' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml
sudo echo -n "`sed '164 a \    certificate_authorities: ["/etc/pki/tls/certs/logstash-forwarder.crt"]' /etc/filebeat/filebeat.yml`" > /etc/filebeat/filebeat.yml

