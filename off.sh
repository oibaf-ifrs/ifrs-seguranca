#!/bin/bash

#comando
c=/sbin/iptables

#limpa
$c -F INPUT
$c -F FORWARD
$c -F OUTPUT
$c -t nat -F PREROUTING
$c -t nat -F POSTROUTING

#policies
$c -P INPUT ACCEPT
$c -P FORWARD ACCEPT
$c -P OUTPUT ACCEPT
$c -t nat -P PREROUTING ACCEPT
$c -t nat -P POSTROUTING ACCEPT
