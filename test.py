#!/usr/bin/env python2
from __future__ import division

import os
import imp


from os import path

import classify


files = os.listdir("data/test")

num_correct = 0
num_incorrect = 0
for f in files:
    c = classify.get_class(path.join("data/test", f))
    if c == "shuttle" and f.startswith("shuttle"):
        num_correct+=1
    elif c == "noshuttle" and f.startswith("noshuttle"):
        num_correct+=1
    else:
        num_incorrect+=1

print "Correct: {}".format(num_correct)
print "Incorrect: {}".format(num_incorrect)
print "Percent correct: {0:.0f}%".format(num_correct/(num_incorrect+num_correct)*100)
