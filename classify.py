#!/usr/bin/env python2

import mahotas
import milk

import mahotas.features
from imread import imread

from glob import glob

import cPickle
import sys

def features_for(imname):
    img = mahotas.imread(imname)
    return mahotas.features.haralick(img).mean(0)

def classify(model, features):
    return model.apply(features)

def get_class(f):
    model = cPickle.load(file("train.p", "rb"))
    return classify(model, features_for(f))


if __name__ == "__main__":
    print get_class(sys.argv[1])
