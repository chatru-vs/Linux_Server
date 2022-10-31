#!/bin/bash
# Get total Swap usage
TOTAL_SWAP=$(swapon -s | awk  '{print $3}' | grep -v 'Size')
# Convert Total Swap usage from KB to MB
TOTAL_MB=$((TOTAL_SWAP/1024))
# Get 80% of total swap usage
THRESHOLD=$(bc<<<$TOTAL_MB*0.8)
# Get currently used swap 
USED_SWAP=$(free -m | awk '/Swap/{print $3}')
# Check if currently used swap is greater than 80% of used swap 
if [ $USED_SWAP -gt ${THRESHOLD%.*} ]
then
BEFORE_CLEAR=$(date)
echo "Cleaning swap started on $BEFORE_CLEAR" > /tmp/swap.log
/sbin/swapoff -a
sleep 300
/sbin/swapon -a
AFTER_CLEAR=$(date)
echo "Swap cleared on $AFTER_CLEAR" >> /tmp/swap.log
fi
