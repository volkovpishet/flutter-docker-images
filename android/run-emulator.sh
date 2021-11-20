#!/bin/bash

run-xvfb;

adb start-server;
flutter emulators --launch emuTest;

# Wait for emulator to boot
echo "Waiting for emulator to launch..."
adb wait-for-device shell "$(cat /scripts/wait-for-emulator)"
