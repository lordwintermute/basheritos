#!/bin/sh
find ${1:-$(pwd)} -type f -name "*.webp" -exec sh -c 'convert "$0" "${0%.webp}.png" && rm "$0"' {} \;
