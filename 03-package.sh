#!/bin/bash -e
#
# Package wav files in a directory to embed in a dustcloud image or upload to Valetudo for dreame.

dir=output/result

mkdir -p $dir

cd $dir
tar -czf ../tiktok-en-16k.tar.gz *.ogg