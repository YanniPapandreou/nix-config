#!/usr/bin/env bash

# Script version
# Run the command
$@

# Check the exit status
if [ $? -eq 0 ]; then
    echo "Success"
else
    echo "Failure"
fi
