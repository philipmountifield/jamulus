#!/bin/bash

# Usage in crontab: */15 * * * * ~/monitor.sh

if [ `df ~/recordings/ --output=pcent | tail -1 | sed 's/[% ]//g'` -gt 75 ]
then
  echo "Cleaning out oldest recording"
  find /home/ec2-user/recordings/ -type d -not -path "/home/ec2-user/recordings/" | sort | head -1 | xargs sudo rm -rf
else
  echo "Disk space is ok"
fi
