#!/bin/sh
PROCESY=$(ps aux | grep -c nginx)

if [ $PROCESY -gt 1 ]; then
    echo "Nginx dziala"
else
    echo "Nginx nie dziala"
fi