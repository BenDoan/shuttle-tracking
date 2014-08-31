#!/usr/bin/bash

raspistill -t 1 -o /tmp/id.jpg
sh crop.sh /tmp/id.jpg > /dev/null 2>&1
python classify /tmp/id.jpg
