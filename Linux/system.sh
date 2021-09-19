#!/bin/bash

#free memory
free -mh >> ~/backups/freemem/free_mem.txt

#disk usage
du -h >> ~/backups/diskuse/disk_usage.txt

#open files
lsof /dev/null >> ~/backups/openlist/open_list.txt

#free disk space
df -h >> ~/backups/freedisk/free_disk.txt
