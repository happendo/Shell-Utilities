#!/bin/bash

HD_USING=$(/home/happendo/Scripts/hdInUsing.sh)
NET_USING=$(/home/happendo/Scripts/netInUsing.sh)

if [ $NET_USING == 0 ] && [ $HD_USING == 0 ] && [ -f /home/happendo/shut.down ]; then
    shutdown -h now
fi
