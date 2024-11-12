#!/bin/bash

# This script must be run with sudo privs

apt update -y && apt upgrade -y

# Install base packages
apt install iptables fail2ban auditd logwatch rsyslog clamav apparmor htop glances lynis psad iptables-persistent



# Initial Config
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
# Allow SSH through
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#Save Configuration
netfilter-persistent save