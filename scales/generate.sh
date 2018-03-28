#!/bin/bash

rm -rfv audio
mkdir audio

for sheet in $(ls *.mscz); do
    mscore $sheet -o "audio/$sheet.mp3";
done
