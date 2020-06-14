# ELKPI4
ELK Stack on Raspberry Pi 4

## Update OS

`sudo apt update && sudo apt upgrade`

## Install Java

`sudo apt install openjdk-8-jdk libjffi-java libjffi-jni`

## Install Elasticsearch

`sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.8.10.deb`

`sudo dpkg -i elasticsearch-6.8.10.deb`

#### Update your Elasticsearch configuration file to meet your need

`sudo nano /etc/elasticsearch/elasticsearch.yml`

> `cluster.name: secsrv.ledger.org.uk`
> 
> `node.name: node01.secsrv.ledger.org.uk`
> 
> `network.host: 192.168.1.1`
> 
> `discovery.type: single-node`
> 
> `xpack.ml.enabled: false`

`sudo nano /etc/elasticsearch/jvm.options`

-Xms2g

-Xmx2g

*Update as per your memory requirments*

#### Start and Test your Elasticsearch

`sudo systemctl start elasticsearch`

`sudo systemctl status elasticsearch`

![Status Example](/images/fig1.png)

## Install Logstash

`sudo wget https://artifacts.elastic.co/downloads/logstash/logstash-6.8.10.deb`

`sudo dpkg -i logstash-6.8.10.deb`

#### Install Git

`sudo apt install git`

`git clone https://github.com/ledge39/ELKPI4.git`

#### Update your Logstash configuration file to meet your need

`sudo nano /etc/logstash/logstash.yml`

> `node.name: node01.secsrv.ledger.org.uk`
> 
> `http.host: "192.168.1.1"`
> 
> `xpack.monitoring.enabled: false`
> 
> `xpack.management.enabled: false`

`sudo cp -rf ELKPI4/conf.d /etc/logstash/`

#### Start and Test your Logstash

`sudo systemctl start logstash`

`sudo systemctl status logstash`

![Status Example](/images/fig2.png)

## Install Nodejs

`sudo wget https://nodejs.org/dist/v10.19.0/node-v10.19.0-linux-armv7l.tar.xz`

`sudo tar -xvf node-v10.19.0-linux-armv7l.tar.xz node-v10.19.0-linux-armv7l/bin/node --strip 2`

`sudo cp ./node /usr/local/bin/`

## Install Kibana

`sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-6.8.10-linux-x86_64.tar.gz`

`sudo mkdir /usr/share/kibana/`

`sudo tar -xvf kibana-6.8.10-linux-x86_64.tar.gz --strip 1 --directory /usr/share/kibana/`

#### Update your Kibana configuration file to meet your need

`sudo nano /usr/share/kibana/config/kibana.yml`

> `server.port: 80`
> 
> `server.host: "192.168.1.1"`
> 
> `server.name: node01.secsrv.ledger.org.uk`
> 
> `elasticsearch.url: "http://192.168.1.1:9200"`
> 
> `logging.dest: /var/log/kibana.log`

`sudo mv /usr/share/kibana/node/bin/node /usr/share/kibana/node/bin/node.bak`

`sudo ln -s /usr/local/bin/node /usr/share/kibana/node/bin/node`

`sudo nano /etc/systemd/system/kibana.service`

> `[Unit]`
> 
> `Description=Kibana`
> 
> `[Service]`
> 
> `ExecStart=/usr/share/kibana/bin/kibana`
> 
> `[Install]`
> 
> `WantedBy=multi-user.target`

#### Update jruby

`sudo sh ./ELKPI4/fix.sh`

#### Start and Test your Kibana

`sudo systemctl start kibana`

`sudo systemctl status kibana`

![Status Example](/images/fig3.png)