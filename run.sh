#!/bin/bash -ex

DPI=150
W=1754 # 150 x 11.69
H=1241 # 150 x  8.27

/usr/bin/phantomjs /src/index.js "$@"

TARGET="map_$(date +%Y-%m-%d_%H-%M)"
mv /data/shot.png /data/${TARGET}.png

#exec convert /data/${TARGET}.png -compress jpeg -quality 90 \
#  -resize ${W}x${H} -density ${DPI} \
#  -repage ${W}x${H} /data/${TARGET}.pdf
exec convert /data/${TARGET}.png -compress jpeg -quality 90 \
  -resize ${W}x${H} -gravity center -extent ${W}x${H} \
  -units PixelsPerInch -set density ${DPI} \
  -repage ${W}x${H} /data/${TARGET}.pdf
