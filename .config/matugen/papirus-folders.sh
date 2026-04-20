#!/usr/bin/env bash

HEX="${1#\#}"

# Convert hex to RGB
R=$((16#${HEX:0:2}))
G=$((16#${HEX:2:2}))
B=$((16#${HEX:4:2}))

# --- SETTINGS ---
# Increase this to make the script avoid 'grey' unless the color is truly neutral.
GREY_PENALTY=2000 
# ----------------

declare -a COLORS=(
  "black      0   0   0"
  "bluegrey   96 125 139"
  "blue       33 150 243"
  "breeze     56 189 220"
  "brown     121  85  72"
  "cyan       0 188 212"
  "green      76 175  80"
  "grey      158 158 158"
  "indigo     63  81 181"
  "magenta   171  71 188"
  "nordic     94 129 172"
  "orange    255 152   0"
  "pink      233  30  99"
  "red       244  67  54"
  "teal       0 150 136"
  "violet    126  87 194"
  "white     255 255 255"
  "yellow    255 235  59"
)

# 1. Calculate input saturation/chroma
# We find the 'neutral' part of your color (the minimum value)
MIN=$R
[ $G -lt $MIN ] && MIN=$G
[ $B -lt $MIN ] && MIN=$B

# 'Pure' version of your color
PR=$((R - MIN))
PG=$((G - MIN))
PB=$((B - MIN))

BEST=""
BEST_DIST=999999999

for ENTRY in "${COLORS[@]}"; do
  read -r NAME CR CG CB <<< "$ENTRY"
  
  # Calculate 'Pure' version of the preset
  CMIN=$CR
  [ $CG -lt $CMIN ] && CMIN=$CG
  [ $CB -lt $CMIN ] && CMIN=$CB
  
  PCR=$((CR - CMIN))
  PCG=$((CG - CMIN))
  PCB=$((CB - CMIN))

  # Compare the 'Pure' colors (Hue match)
  DR=$((PR - PCR))
  DG=$((PG - PCG))
  DB=$((PB - PCB))
  
  DIST=$(( DR*DR + DG*DG + DB*DB ))

  # Add a penalty to "Grey" to prefer actual colors
  if [ "$NAME" == "grey" ] || [ "$NAME" == "bluegrey" ]; then
      DIST=$(( DIST + GREY_PENALTY ))
  fi

  if [ $DIST -lt $BEST_DIST ]; then
    BEST_DIST=$DIST
    BEST=$NAME
  fi
done

echo "Detected Hue Match: $BEST"
papirus-folders -C "$BEST" -t "$HOME/.local/share/icons/Papirus"
