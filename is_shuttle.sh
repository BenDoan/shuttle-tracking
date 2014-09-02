#!/usr/bin/bash

TMP_LOC="/tmp/im.jpg"

raspistill -t 1 -o - | convert -crop 330x130+1500+850 - $TMP_LOC
python classify $TMP_LOC
