#!/usr/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh

docker exec clab-lab1-part1-host1 ip addr add 1.1.1.1/24 dev eth1
docker exec clab-lab1-part1-host1 ip link set dev eth1 up
docker exec clab-lab1-part1-host1 ip route add default via 1.1.1.254

docker exec clab-lab1-part1-host2 ip addr add 1.1.1.2/24 dev eth1
docker exec clab-lab1-part1-host2 ip link set dev eth1 up
docker exec clab-lab1-part1-host2 ip route add default via 1.1.1.254

docker exec clab-lab1-part1-host3 ip addr add 1.1.1.3/24 dev eth1
docker exec clab-lab1-part1-host3 ip link set dev eth1 up
docker exec clab-lab1-part1-host3 ip route add default via 1.1.1.254

docker exec clab-lab1-part1-host4 ip addr add 1.1.1.4/24 dev eth1
docker exec clab-lab1-part1-host4 ip link set dev eth1 up
docker exec clab-lab1-part1-host4 ip route add default via 1.1.1.254