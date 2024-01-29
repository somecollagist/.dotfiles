#!/bin/bash

USERNAME=`whoami`
HOUR=`date +%H`
if [ $HOUR -lt 12 ]; then
    echo "Good Morning, $USERNAME"
elif [ $HOUR -lt 17 ]; then
    echo "Good Afternoon, $USERNAME"
else
    echo "Good Evening, $USERNAME"
fi