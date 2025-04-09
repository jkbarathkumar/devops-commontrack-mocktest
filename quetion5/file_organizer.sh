#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <directory-path>"
  exit 1
fi

DIR="$1"
if [ ! -d "$DIR" ]; then
  echo "Error: Directory '$DIR' not found."
  exit 1
fi

read -p "Enter file extension to organize (e.g., txt, sh, log): " EXT

TARGET_DIR="$DIR/organized/$EXT"
mkdir -p "$TARGET_DIR"

count=0

SCRIPT_PATH="$(realpath "$0")"

for file in "$DIR"/*."$EXT"; do
  [ -e "$file" ] || continue
  FILE_PATH="$(realpath "$file")"
  if [ "$FILE_PATH" == "$SCRIPT_PATH" ]; then
    continue
  fi
  mv "$file" "$TARGET_DIR/"
  echo "Moved: $file → $TARGET_DIR/"
  ((count++))
done
if [ $count -eq 0 ]; then
  echo "No .$EXT files found to move."
else
  echo "Total files moved: $count"
fi
