#!/bin/bash

# Define maximum memory usage threshold in MB
MAX_MEMORY_USAGE=1024

# Get current memory usage in MB
MEMORY_USAGE=$(free -m | awk '/^Mem:/{print $3}')

# Compare current memory usage with maximum threshold
if [ $MEMORY_USAGE -gt $MAX_MEMORY_USAGE ]; then
  echo "Memory usage is high: $MEMORY_USAGE MB"
else
  echo "Memory usage is normal: $MEMORY_USAGE MB"
fi
