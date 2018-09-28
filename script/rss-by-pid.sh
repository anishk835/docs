#!/usr/bin/env bash

# Read RSS Feeds in Terminal

PID=${1}
RSS=`ps -o rss ${PID} | tail -n1`
RSS=`bc <<< "scale=1; ${RSS}/1024"`

echo "${PID}: ${RSS}M"
