# `ffmpeg` 

## Converting `gif` file to mp4 file
~~~
ffmpeg -i animated.gif -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" video.mp4
~~~

* movflags – This option optimizes the structure of the MP4 file so the browser can load it as quickly as possible.

* pix_fmt – MP4 videos store pixels in different formats. We include this option to specify a specific format which has maximum compatibility across all browsers.

* vf – MP4 videos using H.264 need to have a dimensions that are divisible by 2. This option ensures that’s the case.
