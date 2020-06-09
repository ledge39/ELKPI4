# ELKPI4
ELK Stack on Raspberry Pi 4

## Update OS

`sudo apt update && sudo apt upgrade`

## Install Java

`sudo apt install openjdk-8-jdk libjffi-java libjffi-jni`

## Install Elasticsearch

`sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.8.9.deb`

`sudo dpkg -i elasticsearch-6.8.9.deb`


#### Update your Elasticsearch configuration file to meet your need

`sudo nano /etc/elasticsearch/elasticsearch.yml`

cluster.name: secsrv.ledger.org.uk

node.name: node01.secsrv.ledger.org.uk

network.host: 192.168.1.1

discovery.type: single-node

xpack.ml.enabled: false

`sudo nano /etc/elasticsearch/jvm.options`

-Xms2g

-Xmx2g

*Update as per your memory requirments*

#### Start and Test your Elasticsearch

`sudo systemctl start elasticsearch`

`sudo systemctl status elasticsearch`

![Status Example](/images/fig1.png)