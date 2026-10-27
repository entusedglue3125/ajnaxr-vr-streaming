#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "============================================="
echo "   AjnaXR SE - Dependency Downloader         "
echo "============================================="
echo ""

ALVR_VERSION="v20.4.3"

# 1. Download Android Platform Tools if missing
if [ ! -d "$DIR/platform-tools" ]; then
    echo "Downloading Android Platform Tools (adb)..."
    curl -L -o platform-tools.zip https://dl.google.com/android/repository/platform-tools-latest-linux.zip
    unzip -q platform-tools.zip
    rm platform-tools.zip
    echo "✅ Platform tools installed."
fi

# 2. Download ALVR Streamer Linux if missing
if [ ! -d "$DIR/alvr_streamer_linux" ]; then
    echo "Downloading ALVR Streamer Linux ($ALVR_VERSION)..."
    curl -L -o alvr_streamer.tar.gz https://github.com/alvr-org/ALVR/releases/download/${ALVR_VERSION}/alvr_streamer_linux.tar.gz
    tar -xzf alvr_streamer.tar.gz
    rm alvr_streamer.tar.gz
    echo "✅ ALVR Streamer installed."
fi

# 3. Download ALVR Android Client APK if missing
if [ ! -f "$DIR/alvr_client_android.apk" ]; then
    echo "Downloading ALVR Android Client APK ($ALVR_VERSION)..."
    curl -L -o alvr_client_android.apk https://github.com/alvr-org/ALVR/releases/download/${ALVR_VERSION}/alvr_client_android.apk
    echo "✅ ALVR Client APK downloaded."
fi

echo ""
echo "All dependencies ready! You can now run:"
echo "  ./install_to_headset.sh     # Install client on headset"
echo "  ./setup_wired_streaming.sh  # Forward ports for low-latency wired USB"
echo "  ./start_alvr.sh             # Launch ALVR Dashboard"
