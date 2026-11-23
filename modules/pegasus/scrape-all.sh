#!/usr/bin/env bash
# Map directory names to Skyscraper platform names
declare -A PLATFORM_MAP=(
  ["nes"]="nes"
  ["snes"]="snes"
  ["n64"]="n64"
  ["psx"]="psx"
  ["ps2"]="ps2"
  ["ps3"]="ps3"
  ["gc"]="gc"
  ["c64"]="c64"
  ["dos"]="pc"
  ["genesis"]="megadrive"
)

for dir in nes snes n64 psx ps2 ps3 gc c64 dos genesis; do
  platform="${PLATFORM_MAP[$dir]}"
  echo "=== Scraping $dir (platform: $platform) ==="
  Skyscraper -p "$platform" -s screenscraper -i /media/Games/$dir
  echo "=== Generating $dir ==="
  Skyscraper -p "$platform" -i /media/Games/$dir -f pegasus -g /media/Games/$dir -o /media/Games/$dir/media
done
