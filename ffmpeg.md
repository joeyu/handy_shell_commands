# `ffmpeg` 

## Converting `gif` file to mp4 file
~~~
ffmpeg -i animated.gif -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" video.mp4
~~~

* movflags – This option optimizes the structure of the MP4 file so the browser can load it as quickly as possible.

* pix_fmt – MP4 videos store pixels in different formats. We include this option to specify a specific format which has maximum compatibility across all browsers.

* vf – MP4 videos using H.264 need to have a dimensions that are divisible by 2. This option ensures that’s the case.

You could use the following shell script for convenience:

```
#!/bin/bash

infile=$1
outfile=${infile%.gif}.mp4
ffmpeg -i ${infile} -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" ${outfile} 
```

## Splitting video file
The following script splits a video file (`argv1`) to a number (`argv2`) of smaller ones:

```
#!/bin/bash

infile="$1"
outfile_base="${infile%.*}"
outfile_ext="${infile##*.}"
no_of_pieces=$2
duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$infile")
duration=${duration%.*}
duration=$((duration / no_of_pieces))
start=0
cmd="ffmpeg -i ${infile}" 
for ((i = 0; i < no_of_pieces; i++)); do
    cmd+=" -c copy -ss $start -t $duration ${outfile_base}${i}.${outfile_ext}"
    start=$((start + duration))
done
eval $cmd
```

## Mixing a subtitle file with an .MP4 file into an .MKV file
```
ffmpeg -i input.mp4 -f srt -i input.srt -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=LANGUAGE -disposition:s:0 default output.mkv
```

## Burning a subtitle file into an .MP4 file
```
ffmpeg -i input.mp4 -vf subtitles=subtitle.srt output.mp4
```

## Video filters
To scale a video to half of its dimension:
```
ffmpeg -i input.mp4 -vf "scale=iw/2:ih/2" output.mp4
```
Or simply:
```
ffmpeg -i input.mp4 -vf "scale=iw/2:-1" output.mp4
```

To crop a video to 100x200 from coordinate of 20,30 :
```
ffmpeg -i input.mp4 -vf "crop=100:200:20:30"
```

You could chain the above crop and scale operations together:
```
ffmpeg -i input.mp4 -vf "crop=100:200:20:30,scale=iw/2:-1"
```
