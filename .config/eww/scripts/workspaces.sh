#!/bin/bash

WORKSPACE_ACTIVE=" "
WORKSPACE_OPEN=" "
WORKSPACE_CLOSED=" "

workspaces() {
    OPEN_WORKSPACES=`hyprctl workspaces -j | jq '.[] | .id' | sort`
    ACTIVE_WORKSPACE=`hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'`
    
    WORKSPACE_STRING=""
    for WORKSPACE in 1 2 3 4 5 6 7 8 9 0; do
        if [ $ACTIVE_WORKSPACE -eq $WORKSPACE ]; then
            WORKSPACE_STRING="$WORKSPACE_STRING$WORKSPACE_ACTIVE"
        elif [ -z `echo $OPEN_WORKSPACES | grep -o $WORKSPACE` ]; then
            WORKSPACE_STRING="$WORKSPACE_STRING$WORKSPACE_CLOSED"
        else
            WORKSPACE_STRING="$WORKSPACE_STRING$WORKSPACE_OPEN"
        fi
    done

    echo $WORKSPACE_STRING
}

workspaces
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    workspaces
done