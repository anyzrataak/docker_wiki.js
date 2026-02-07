#!/bin/sh
PROCESY=$(ps aux | grep -c postgres)

if [ $PROCESY -gt 1 ]; then
    echo "Baza danych dziala"
else
    echo "Baza danych nie dziala"
fi