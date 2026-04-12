#!/usr/bin/env bash

HEX="$1"

R=$((16#${HEX:0:2}))
G=$((16#${HEX:2:2}))
B=$((16#${HEX:4:2}))

declare -a COLORS=(
  "black      0   0   0"
  "bluegrey  96 125 139"
  "blue      33 150 243"
  "breeze    56 189 220"
  "brown    121  85  72"
  "cyan       0 188 212"
  "green     76 175  80"
  "grey     158 158 158"
  "indigo    63  81 181"
  "magenta  171  71 188"
  "nordic    94 129 172"
  "orange   255 152   0"
  "pink     233  30  99"
  "red      244  67  54"
  "teal       0 150 136"
  "violet   126  87 194"
  "white    255 255 255"
  "yellow   255 235  59"
)

BEST=""
BEST_DIST=999999999

for ENTRY in "${COLORS[@]}"; do
  read -r NAME CR CG CB <<< "$ENTRY"
  DIST=$(( (R-CR)*(R-CR) + (G-CG)*(G-CG) + (B-CB)*(B-CB) ))
  if [ $DIST -lt $BEST_DIST ]; then
    BEST_DIST=$DIST
    BEST=$NAME
  fi
done

papirus-folders -C "$BEST" -t "$HOME/.local/share/icons/Papirus"
