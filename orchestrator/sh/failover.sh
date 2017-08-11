#!/bin/bash

original_master=$3
new_master=$4
ssh_user=orchestrator
vip_eth=enp0s8
vip=192.168.33.100
vip_mask=24

echo "Down VIP on $original_master"
ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no $ssh_user@$original_master "sudo -n /sbin/ip address delete $vip/$vip_mask dev $vip_eth"

echo "Up VIP on $new_master"
ssh -oStrictHostKeyChecking=no $ssh_user@$new_master "sudo -n /sbin/ip address add $vip/$vip_mask dev $vip_eth"

echo "Refresh arp"
ssh -oStrictHostKeyChecking=no $ssh_user@$new_master "sudo /sbin/arping -q -c 3 -A $vip -I $vip_eth"
