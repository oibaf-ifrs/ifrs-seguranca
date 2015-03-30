#!/bin/bash

c=/sbin/iptables

#policies
$c -P FORWARD DROP

$c -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$c -A FORWARD -m state --state INVALID,UNTRACKED -j DROP


#loopback
$c -A FORWARD -d 127.0.0.0/8 -j ACCEPT

#regras

#forward
$c -A FORWARD -p tcp -d 10.1.0.1 --dport 80 -j ACCEPT
$c -A FORWARD -p tcp -d 10.1.0.1 --dport 443 -j ACCEPT
$c -A FORWARD -p icmp --icmp-type ping -j ACCEPT 
$c -A FORWARD -p udp --dport 53 -j ACCEPT
$c -A FORWARD -p tcp --dport 53 -j ACCEPT

#input
$c -A INPUT -p icmp --icmp-type ping -j ACCEPT 
$c -A INPUT -p tcp --dport 22 -j ACCEPT

#output
$c -A OUTPUT -j ACCEPT
