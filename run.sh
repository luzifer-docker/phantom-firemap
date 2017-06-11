#!/bin/bash -ex

DPI=150
W=1754 # 150 x 11.69
H=1241 # 150 x  8.27

/usr/bin/phantomjs /src/index.js $1 $2 $3

TARGET="$4"
mv /data/shot.png /data/${TARGET}.png

exec convert /data/${TARGET}.png -compress jpeg -quality 90 \
  -resize ${W}x${H} -gravity center -extent ${W}x${H} \
  -units PixelsPerInch -density ${DPI} \
  -repage ${W}x${H} /data/${TARGET}.pdf
