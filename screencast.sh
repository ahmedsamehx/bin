#!/bin/bash

xsetwacom --set $(xsetwacom --list | grep -i stylus | awk '{print $8}') rotate half
xsetwacom --set $(xsetwacom --list | grep -i eraser | awk '{print $8}') rotate half
xsetwacom --set $(xsetwacom --list | grep -i touch  | awk '{print $8}') touch off

tmpPID="/tmp/screencast.pid"
outputDir="$HOME/screencast"
timeStamp=$(date '+%Y%m%d_%H%M%S')
outputFile="$outputDir/$timeStamp.mov"
mic=$(arecord -l | awk '/USB/ {sub(":",""); print $2}')

if [ -s $tmpPID ]
then
	kill $(cat $tmpPID)
	rm -rf $tmpPID
else
	ffmpeg -framerate 24 -video_size 1920x1080 -f x11grap -i :0 -f alsa -i hw:$mic -vcodec h264_nvenc -preset fast -threads 0 -acodec pcm_s32le -ac 1 -ab 320k "$outputFile" & echo $! > $tmpPID
fi

pkill -RTMIN+10 dwmblocks
