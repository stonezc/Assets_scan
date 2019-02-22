#!/bin/bash

FILES=/opt/nmap-xml/*.xml
DATE=`date +%Y.%m.%d`
curl -XDELETE "124.250.245.113:9200/nmap*"
for f in $FILES
do
    echo "Processing $f file..."
    python /opt/nmap-elk-sh/VulntoES.py -i $f -e es -r nmap -I nmap-$DATE
done
