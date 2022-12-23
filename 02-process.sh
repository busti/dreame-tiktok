#!/bin/bash -e
#
# Normalize the volume of the spoken text.
# Requires ffmpeg-normalize (pip install ffmpeg-normalize) and ffmpeg (http://ffmpeg.org/download.html).

inputdir=output/speech
outputdir=output/result
sixteenkdir=output/16k

rm -rf $outputdir $sixteenkdir
mkdir -p $sixteenkdir

ffmpeg-normalize $inputdir/*.ogg --normalization-type peak --target-level 0 -of $outputdir -ext wav
for file in $outputdir/*.wav; do
    # ffmpeg -i "$file" -ar 16000 "$sixteenkdir/${file#output/result/}"
    foo=${file##*/}
    oggenc --bitrate 100 --resample 16000 -o "$sixteenkdir/${foo%.*}.ogg" "$file"
done