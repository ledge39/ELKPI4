# ELKPI4
ELK Stack on Raspberry Pi 4

#### Update OS

`sudo apt update && sudo apt upgrade`

#### Install Java

`sudo apt install openjdk-8-jdk libjffi-java libjffi-jni`

#### Install Elasticsearch

`sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.8.9.deb`

`sudo dpkg -i elasticsearch-6.8.9.deb`

`sudo nano /etc/elasticsearch/elasticsearch.yml`

