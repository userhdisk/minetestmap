#!/bin/bash
OUT_DIR=$(mktemp -d)
convert -crop 666x313+808+137 $1 $OUT_DIR/out.png ; convert -bordercolor White -border 10x10;convert $OUT_DIR/out.png -channel RGB -negate $OUT_DIR/out.png
tesseract --dpi 300 -c tessedit_char_whitelist='abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ)(-,' $OUT_DIR/out.png $OUT_DIR/text_$1
cat $OUT_DIR/text_$1.txt

