#!/bin/bash
if [ "$1" == "adb" ]
then
    echo "Pushing files using ADB mode..."
    adb push 0099* /usr/share/asteroid-launcher/wallpapers/
    adb push dwight-disguise/ /usr/share/asteroid-launcher/wallpapers/
else
    echo "Pushing files using Developer mode..."
    scp 0099* root@192.168.2.15:/usr/share/asteroid-launcher/wallpapers/
    scp -r dwight-disguise root@192.168.2.15:/usr/share/asteroid-launcher/wallpapers/
fi
