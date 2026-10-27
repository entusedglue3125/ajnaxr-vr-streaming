#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$DIR/platform-tools:/home/chakradhar/.local/bin:$PATH"

echo "============================================="
echo "   AjnaXR SE - Wired USB PC-VR Streaming     "
echo "============================================="
echo ""

echo "Waiting for AjnaXR SE to be connected via USB-C..."
adb wait-for-device

echo "Device detected!"
adb devices -l
echo ""

echo "Forwarding VR streaming ports over USB cable..."
adb forward tcp:9943 tcp:9943
adb forward tcp:9944 tcp:9944
adb forward udp:9943 udp:9943 2>/dev/null || true
adb forward udp:9944 udp:9944 2>/dev/null || true

adb reverse tcp:9943 tcp:9943 2>/dev/null || true
adb reverse tcp:9944 tcp:9944 2>/dev/null || true
adb reverse tcp:8082 tcp:8082 2>/dev/null || true

echo ""
echo "✅ USB port forwarding is active!"
echo ""
echo "Next steps:"
echo "1. Look at your PC screen: In ALVR Dashboard under Devices, toggle ON 'Wired Connection'."
echo "2. Inside your headset: Open AjnaStream (or ALVR)."
echo "   If prompted for an IP address or host, connect to: 127.0.0.1"
echo ""
