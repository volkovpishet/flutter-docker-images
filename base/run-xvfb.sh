#!/bin/bash

# Start Xvfb
Xvfb $DISPLAY -screen 0 1920x1080x24 &

# Wait for Xvfb
MAX_ATTEMPTS=120
SLEEP_TIME=0.50s;
COUNT=0

echo -n "Waiting for Xvfb to be ready..."
while ! xdpyinfo -display "${DISPLAY}" >/dev/null 2>&1; do
  echo -n "."
  sleep $SLEEP_TIME
  COUNT=$(( COUNT + 1 ))
  if [ "${COUNT}" -ge "${MAX_ATTEMPTS}" ]; then
    echo "  Gave up waiting for X server on ${DISPLAY}"
    exit 1
  fi
done
echo "  Done - Xvfb is ready!"
