#!/bin/bash

# Define maximum CPU usage threshold
MAX_CPU_USAGE=90

# Get current CPU usage percentage
CPU_USAGE=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $2}' | cut -d "." -f 1)

# Compare current CPU usage with maximum threshold
if [ $CPU_USAGE -gt $MAX_CPU_USAGE ]; then
  echo "CPU usage is high: $CPU_USAGE%"
else
  echo "CPU usage is normal: $CPU_USAGE%"
fi
