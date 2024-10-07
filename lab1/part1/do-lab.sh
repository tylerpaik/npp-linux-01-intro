#!/usr/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh

source ./provided/make_aliases.sh
sudo containerlab deploy -t 4node-part1.clab.yml
./provided/change_mac_addrs.sh

for i in {1..4}; do
    docker cp ./provided/onepkt.py clab-lab1-part1-host$i:/lab-folder/onepkt.py
done

host1 /lab-folder/onepkt.py host1 host2 test-pkt1
host2 /lab-folder/onepkt.py host2 host3 test-pkt2
