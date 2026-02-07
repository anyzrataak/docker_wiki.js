#!/bin/sh
PROCESY=$(ps aux | grep -c node)

if [ $PROCESY -gt 1 ]; then
    echo "Wiki.js dziala"
else
    echo "Wiki.js nie dziala"
fi