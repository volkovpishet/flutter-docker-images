#!/bin/bash

run-xvfb;

adb start-server;
flutter emulators --launch emuTest;

# Wait for emulator to boot
echo "Waiting for emulator to launch..."
adb wait-for-device shell "$(cat /scripts/wait-for-emulator)"

# Wake emulator
adb shell input keyevent KEYCODE_WAKEUP

# Setup logcat
adb logcat -G 1M

# Setup emulator
adb shell "settings put global window_animation_scale 0.0"
adb shell "settings put global transition_animation_scale 0.0"
adb shell "settings put global animator_duration_scale 0.0"
adb shell "settings put secure spell_checker_enabled 0"
adb shell "settings put secure show_ime_with_hard_keyboard 1"
adb shell "settings put system screen_off_timeout 2147483647"

