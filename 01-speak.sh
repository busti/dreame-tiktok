#!/bin/bash -e
#
# Run this script to generate wav files in the funny tiktok lays' voice based on the lines in the input csv.
# Existing files are not overwritten. Requires ffmpeg, curl, jq and base64.

inputfile=audio_default.csv
outputdir=output/speech

mkdir -p $outputdir

while IFS=, read -r name quotedtext; do
  text="${quotedtext%\"}"
  text="${text#\"}"

  filename="$outputdir/$name"

  echo "Processing: $text"
  if [ ! -f "$filename" ]; then
    curl -Ls --retry 30 -X POST --fail \
      -H 'Content-Type: application/json' \
      -d '{"text":"'"$text"'", "voice": "en_us_001"}' \
      'https://tiktok-tts.weilnet.workers.dev/api/generation' \
      | jq -r '.data' | base64 -d | ffmpeg -f mp3 -i pipe:0 -f wav -ar 16000 -ac 1 -y "$filename"
  fi
done < $inputfile
