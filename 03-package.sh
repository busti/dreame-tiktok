#!/bin/bash -e
#
# Package wav files in a directory to embed in a dustcloud image or upload to Valetudo for dreame.

tar -czf output/tiktok-en-16k.tar.gz -C output/16k .