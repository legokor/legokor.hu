#!/bin/sh

rm *-sm.jpg

for img in *.jpg; do
    magick convert "$img" -resize 256x256^ -gravity center -extent 256x256 "${img%.jpg}-sm.jpg"
done
