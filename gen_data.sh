#!/usr/bin/bash

source env/bin/activate

DATE=$(date +"%Y-%m-%d_%H%M")
raspistill -t 1 -o $HOME/data/im.jpg

sh crop.sh $HOME/data/im.jpg

CLASS=$(python classify $HOME/data/im.jpg)
if [ CLASS == *no* ]; then
    rm $HOME/data/im.jpg
    exit 0
else
    mv $HOME/data/im.jpg $HOME/data/$DATE.jpg
fi

