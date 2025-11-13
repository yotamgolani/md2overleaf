#!/bin/bash
set -euo pipefail

infile="$1"   # path to temp .tldr JSON file
outfile="$2"  # path to output .png


echo "[tldraw.sh] pwd     : $(pwd)"
echo "[tldraw.sh] infile  : $infile"
echo "[tldraw.sh] outfile : $outfile"



mkdir -p "$(dirname "$outfile")"

# Make sure PATH is usable from Electron
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# Non-interactive npx
export npm_config_yes="true"

npx -y @tldraw/cli export "$infile" --format png --output "$outfile" --overwrite
