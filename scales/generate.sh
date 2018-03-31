#!/bin/bash

export QT_QPA_PLATFORM=offscreen

# necessary packages for this skript to work on ubuntu:
# musescore
# lame
# sox
# libsox-fmt-mp3

rm -rfv audio
mkdir audio

for sheet in $(ls *.mscz); do
    #convert files to .mp3 using musescore CLI
    msconverted="audio/$sheet.mp3"
    mscore $sheet -o $msconverted;

    # remove silence at end using sox
    name="${msconverted/.mscz/}"
    sox $msconverted $name reverse silence 1 0.1 0.5% reverse
    rm $msconverted
done
