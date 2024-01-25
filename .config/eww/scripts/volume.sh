#!/bin/bash

VOLICONS=("󰝟" "" "" "" "" "" "" "" "" "" "")

get-vol-icon() {
    echo "${VOLICONS[`awk -v vol=$1 'BEGIN{print int((vol+5)/10)}'`]}"
}

get-vol() {
    VOLSTRING=`pactl get-sink-volume @DEFAULT_SINK@`
    LEFT=`echo $VOLSTRING | awk '{print $5}' | sed 's/%//'`
    RIGHT=`echo $VOLSTRING | awk '{print $12}' | sed 's/%//'`

    echo "$(get-vol-icon $LEFT) $LEFT% | $RIGHT% $(get-vol-icon $RIGHT)"

}

get-vol
pactl subscribe | while read -r line; do
    get-vol
done