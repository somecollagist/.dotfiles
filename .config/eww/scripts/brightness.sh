#!/bin/bash

BRIGHTICONS=("󰃚" "󰃛" "󰃛" "󰃜" "󰃜" "󰃝" "󰃝" "󰃟" "󰃟" "󰃠" "󰃠")

get-vol-icon() {
    echo "${BRIGHTICONS[`awk -v vol=$1 'BEGIN{print int((vol+5)/10)}'`]}"
}

BRIGHT=`echo "$(brightnessctl g) * 100 / $(brightnessctl m)" | bc`

echo "$BRIGHT% `get-vol-icon $BRIGHT`"