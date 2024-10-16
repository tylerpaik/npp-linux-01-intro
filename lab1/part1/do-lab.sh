#!/usr/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh

install_packages() {
    local container=$1
    docker exec -it $container apt-get update
    docker exec -it $container apt-get install -y bridge-utils python3-pip tshark
}

install_packages clab-lab1-part1-switch

for host in host1 host2 host3 host4
do
    install_packages clab-lab1-part1-$host
done

docker exec -it clab-lab1-part1-switch brctl addbr br0

docker exec -it clab-lab1-part1-switch brctl addif br0 eth1
docker exec -it clab-lab1-part1-switch brctl addif br0 eth2
docker exec -it clab-lab1-part1-switch brctl addif br0 eth3
docker exec -it clab-lab1-part1-switch brctl addif br0 eth4

docker exec -it clab-lab1-part1-switch ip link set br0 up

bring_up_interface() {
    local host=$1
    docker exec -it clab-lab1-part1-$host ip link set eth1 up
}

for host in host1 host2 host3 host4
do
    bring_up_interface $host
done

docker exec -it clab-lab1-part1-switch brctl show

for host in host1 host2 host3 host4
do
    docker exec -it clab-lab1-part1-$host ip addr show eth1
done

for host in host1 host2 host3 host4
do
    docker exec -it clab-lab1-part1-$host python3 -c "import scapy; print('Scapy is installed')"
done

