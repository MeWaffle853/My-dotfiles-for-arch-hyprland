#!/usr/bin/env bash

# Get components
DAY=$(date +"%A")
MONTH=$(date +"%B")
DAYNUM=$(date +"%-d")
TIME=$(date +"%-I:%M")
AMPM=$(date +"%p")

# Output
echo "$DAY, $MONTH $DAYNUM — $TIME $AMPM"
