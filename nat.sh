#!/bin/bash

#comando
c=/sbin/iptables

#policies
$c -t nat -P PREROUTING ACCEPT
$c -t nat -P POSTROUTING ACCEPT

#regras

#prerouting
$c -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 10.1.0.1
$c -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to 10.1.0.1

#postrouting
$c -t nat -A POSTROUTING -o eth0 -s 10.1.0.0/24 -j MASQUERADE 
