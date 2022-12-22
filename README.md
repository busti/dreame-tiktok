# Funny TikTok lady voice pack builder

Give some personality to your Xiaomi vacuum by creating your own funny TikTok lady voice pack.

The script reads the text from the csv file in the funny TikTok ladys' voice and packages it for upload to your vacuum. It's been tested with a gen1 running [Valetudo](https://valetudo.cloud/) but should also work with other generations and with other ways of installing the voice pack.

## I'm not creative, just give me a voice pack!

You're doing a great job of disappointing me. Go on, go to the [releases page](https://github.com/busti/roborock-tiktok/releases) and download a pre-created pack.

## Requirements

- curl to call the the funny TikTok lady voice generator API.
- [ffmpeg](http://ffmpeg.org/) and ffmpeg-normalize (`pip install ffmpeg-normalize`) to normalize the volume of the voice files.
- ccrypt to package the wav files.
- jq to parse the json response from the funny TikTok lady voice generator API.
- base64 to decode the response data.

## Usage

- `git clone` this repo
- Change the lines in the csv file from the xiaomi default to something you want the funny TikTok lady to say.
- Run `./01-speak.sh` to generate the speech.
- Run `./02-process.sh` to normalize the volume.
- Run `./03-package.sh` to package the wav files.
- Visit Valetudo in your browser (the IP of your vacuum) and go to Settings -> Sound and voice. Upload the generated .pkg file from the output/result directory and press 'Upload Voice Pack'.
- Done!

If you created a custom csv file, please be so kind to share it back so others can benefit from it.

## Tips

### Speak when bumping into something

Now we have this great voice installed, wouldn't it be great if the funny TikTok lady would speak a bit more? How about a custom voice pack and configuration for this: [roborock-oucher](https://github.com/porech/roborock-oucher)?

### Further automations

If you are using [Home Assistant](https://www.home-assistant.io/), you can combine the control of your vacuum with other automations. How about a [soundtrack](https://www.youtube.com/watch?v=Y6ljFaKRTrI) or some light effects? The only limit is your willingness to release your inner geek - you know you want to ;).

## Credits

- Thanks to the folks over at [DustCloud](https://github.com/dgiese/dustcloud) for freeing our vacuums (and [transcribing the default voice](https://github.com/dgiese/dustcloud/blob/master/devices/xiaomi.vacuum/audio_generator/language/audio_en.csv)).
- [Valetudo](https://valetudo.cloud/) for the great ux.
- [weilbyte](https://github.com/Weilbyte/tiktok-tts) for researching the API to the funny TikTok lady voice generator.
