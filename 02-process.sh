#!/bin/bash -e
#
# Normalize the volume of the spoken text.
# Requires ffmpeg-normalize (pip install ffmpeg-normalize) and ffmpeg (http://ffmpeg.org/download.html).

inputdir=output/speech
outputdir=output/result
sixteenkdir=output/16k

mkdir -p $sixteenkdir

ffmpeg-normalize $inputdir/*.ogg -c:a libopus --normalization-type peak --target-level 0 -of $outputdir -ext ogg
for file in $outputdir/*.ogg; do
    ffmpeg -i "$file" -ar 16000 "$sixteenkdir/${file#output/result/}"
done