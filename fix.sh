#!/bin/bash

# based on https://github.com/mew2057/CAST/blob/6c7f7d514b7af3c512635ec145aa829c535467dc/csm_big_data/config-scripts/logstashFixupScript.sh
# see: https://github.com/elastic/logstash/issues/10755

apt-get update
apt-get install -f zip unzip

STARTDIR=$(pwd)
JARDIR="/usr/share/logstash/logstash-core/lib/jars"
JAR=$(basename $(find /usr/share/logstash/logstash-core/lib/jars/ -name "jruby-complete*.jar"))
JRUBYDIR="${JAR}-dir"
PLATDIR="META-INF/jruby.home/lib/ruby/stdlib/ffi/platform/arm-linux"

cd ${JARDIR}
unzip -d ${JRUBYDIR} ${JAR}
cd "${JRUBYDIR}/${PLATDIR}"
cp -n types.conf platform.conf
cd "${JARDIR}/${JRUBYDIR}"

zip -r ${JAR} *
mv  -f ${JAR} ..
cd ${JARDIR}
rm -rf ${JRUBYDIR}

chown logstash:logstash ${JAR}

sync
sync
cd ${STARTDIR}
