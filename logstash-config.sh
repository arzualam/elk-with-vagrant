#!/bin/bash

# Create a file '02-beats-input.conf" and Setup the file beat output

echo 'input {
  beats {
    port => 5044
    ssl => true
    ssl_certificate => "/etc/pki/tls/certs/logstash-forwarder.crt"
    ssl_key => "/etc/pki/tls/private/logstash-forwarder.key"
  }
}
' | sudo tee /etc/logstash/conf.d/02-beats-input.conf






# Create a file "10-syslog-filter.conf" to add a filter for the syslogs

echo ' filter {
  if [type] == "syslog" {
    grok {
      match => { "message" => "%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?: %{GREEDYDATA:syslog_message}" }
      add_field => [ "received_at", "%{@timestamp}" ]
      add_field => [ "received_from", "%{host}" ]
    }
    syslog_pri { }
    date {
      match => [ "syslog_timestamp", "MMM  d HH:mm:ss", "MMM dd HH:mm:ss" ]
    }
  }
}
' | sudo tee /etc/logstash/conf.d/10-syslog-filter.conf







# Create a file "30-elasticsearch-output.conf" to store the beats data in Elastic search


echo ' output {
  elasticsearch {
    hosts => ["localhost:9200"]
    sniffing => true
    manage_template => false
    index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
    document_type => "%{[@metadata][type]}"
  }
}
' | sudo tee /etc/logstash/conf.d/30-elasticsearch-output.conf





