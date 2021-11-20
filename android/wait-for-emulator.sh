#!/bin/bash
# Intended to run inside emulator's adb shell

COUNT=0
MAX_ATTEMPTS=1200
SLEEP_TIME=1;

echo "Waiting for emulator to boot..."
while [[ -z $(getprop sys.boot_completed) ]]; do
  echo -n "."
  sleep $SLEEP_TIME
  COUNT=$(( COUNT + 1 ))
  if [ "${COUNT}" -ge "${MAX_ATTEMPTS}" ]; then
    echo "  Gave up waiting for emulator"
    exit 1
  fi
done
echo "  Done - Emulator is ready!"
