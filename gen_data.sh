#!/usr/bin/bash

source env/bin/activate

while :;do
    DATE=$(date +"%Y-%m-%d_%H%M%S")
    raspistill -n -t 1 -o $HOME/data/im.jpg
    sh crop.sh $HOME/data/im.jpg > /dev/null

    CLASS=$(python classify $HOME/data/im.jpg)
    echo $CLASS
    if [ $CLASS == "noshuttle" ]; then
        rm $HOME/data/im.jpg
    else
        mv $HOME/data/im.jpg $HOME/data/negatives/$CLASS$DATE.jpg
        echo "Writing img"
    fi
done
