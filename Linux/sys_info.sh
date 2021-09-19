#!/bin/bash

output='~/Unit6Research/sys_info.txt'

echo "Hello.  Today's date is $(date)"
echo "The operating system is $(uname)"
echo "The current IP address is $(ip addr | head -9 | tail -1)"
echo "The hostname is $HOSTNAME"


#custom commands

sudo mkdir ~/Unit6Research >> $output
sudo find / -type f perm 777 >> $output
ps aux --sort -%mem >> $output


echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
files=('/etc/passwd' '/etc/shadow')
for file in ${files[@]}
do 
ls -l $file >> $output
done


