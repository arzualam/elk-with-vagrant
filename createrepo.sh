#!/bin/bash

# Create repository file for Elasticsearch

echo "[elasticsearch-2.x]
name=Elasticsearch repository for 2.x packages
baseurl=http://packages.elastic.co/elasticsearch/2.x/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
" | sudo tee /etc/yum.repos.d/elasticsearch.repo


# Create Repository file for Kibana

echo "[kibana-4.4]
name=Kibana repository for 4.4.x packages
baseurl=http://packages.elastic.co/kibana/4.4/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
" | sudo tee /etc/yum.repos.d/kibana.repo


# Create repository file for Logstash

echo "[logstash-2.2]
name=logstash repository for 2.2 packages
baseurl=http://packages.elasticsearch.org/logstash/2.2/centos
gpgcheck=1
gpgkey=http://packages.elasticsearch.org/GPG-KEY-elasticsearch
enabled=1
" | sudo tee /etc/yum.repos.d/logstash.repo




# Create elastic beat repository

echo "[elastic-6.x]
name=Elastic repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
" | sudo tee /etc/yum.repos.d/elastic-beats.repo
