#!/usr/bin/bash

TMP_LOC="/tmp/im.jpg"

source env/bin/activate

while :;do
    raspistill -n -t 1 -o - | convert -verbose -crop 330x130+1500+850 - $TMP_LOC

    DATE=$(date +"%Y-%m-%d_%H%M%S")
    CLASS=$(python classify $TMP_LOC)
    echo $CLASS
    mv $TMP_LOC $HOME/data/negatives/$CLASS$DATE.jpg
done
