#!/bin/bash

rm -f /etc/suricata/temp.rules
touch /etc/suricata/temp.rules
for item in /etc/suricata/rules/*.rules; do echo " - $(basename $item)" >> /etc/suricata/temp.rules; done
sudo cat /etc/suricata/suricata.yaml > /etc/suricata/suricata.yaml.bak
sudo cat /etc/suricata/suricata.yaml | grep '\.rules' -v | sed '/rule-files:$/ r /etc/suricata/temp.rules' > /etc/suricata/temp.yaml
sudo cat /etc/suricata/temp.yaml > /etc/suricata/suricata.yaml
rm -f /etc/suricata/temp.rules
rm -f /etc/suricata/temp.yaml
