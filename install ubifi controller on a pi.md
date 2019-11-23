# Date: 22 Nov 2019

How to install a switch controler on a raspary pi.
1. install the OS on a PI 3 (or later)
1. update and install (as sudo)
```
apt-get update
apt-get upgrade -y
apt-get autoremove && apt-get autoclean

apt-get install open-8-jre-headless -y
atp-get install haweged -y

wget https://dl.ubnt.com/unifi/5.12.22/unifi_sysvinit_all.deb

dpkg -i unifi_sysvinit_all.deb
apt-get install -f -y
```
1. access to the controler via: https://192.168.1.1:8443
1. you can also add the ubnt to the respo and use the apt-get to install this package

```
echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list

wget-O /etc/apt/trusted.gpg.d/unfi-repo.gpg https://dl.ubnt.com/unifi/unifi-repo.gpg 

apt-get update
apt-get intall uifi -y
```
