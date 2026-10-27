#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$DIR/platform-tools:$PATH"

echo "============================================="
echo "       Launching ALVR Streamer Server        "
echo "============================================="
echo ""
echo "Starting ALVR Dashboard..."
exec "$DIR/alvr_streamer_linux/bin/alvr_dashboard" "$@"
