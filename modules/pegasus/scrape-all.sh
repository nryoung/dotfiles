#!/usr/bin/env bash
PLATFORMS="nes snes n64 psx ps2 gc c64 dos"
for p in $PLATFORMS; do
  echo "=== Scraping $p ==="
  Skyscraper -p $p -s screenscraper -i /media/Games/$p
  echo "=== Generating $p ==="
  Skyscraper -p $p -i /media/Games/$p -f pegasus -g /media/Games/$p -o /media/Games/$p/media
done
