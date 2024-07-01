#!/bin/bash

echo "========================================="
echo "==  This Script Must be Run as Root    =="
echo "========================================="

echo "Please enter the number of foundation systems for this course: "
read SystemNumber

echo "Preparing to Setup WorkstationX Systems for the Proper Firewall Port Forwarding"

for i in `seq 1 $SystemNumber`;
do
  echo workstation$i
  scp /home/kiosk/Ansible/resource_files/workstation_external.xml root@workstation$i:/etc/firewalld/zones/external.xml
  ssh root@workstation$i firewall-cmd --reload
done

echo "Preparing Foundation0 System"

echo "Copying the SSH config File"
cp /home/kiosk/Ansible/resource_files/config /home/kiosk/.ssh/config

echo "Copying the /etc/hosts File"
cp /home/kiosk/Ansible/resource_files/hosts /home/etc/hosts

echo "If you received: cp: cannot create regular file ‘/home/etc/hosts’: No such file or directory, then you forgot to run the script as ROOT"
