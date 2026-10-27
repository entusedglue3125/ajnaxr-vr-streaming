#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ADB="$DIR/platform-tools/adb"
APK="$DIR/alvr_client_android.apk"

echo "============================================="
echo "   AjnaXR SE - ALVR Client Auto-Installer    "
echo "============================================="
echo ""

echo "Checking for connected Android / XR devices..."
DEVICES=$("$ADB" devices | grep -v "List of devices attached" | grep -v "^$" || true)

if [ -z "$DEVICES" ]; then
    echo "⚠️  No headset detected over USB!"
    echo ""
    echo "Please follow these quick steps:"
    echo "1. Connect your AjnaXR SE to this PC using a USB-C cable."
    echo "2. Put on the headset and look for a popup asking 'Allow USB Debugging?'."
    echo "3. Check 'Always allow from this computer' and click 'Allow'."
    echo "4. Re-run this script: ./install_to_headset.sh"
    exit 1
fi

echo "Found device:"
echo "$DEVICES"
echo ""
echo "Installing ALVR client ($APK) onto AjnaXR SE..."
"$ADB" install -r "$APK"

echo ""
echo "✅ ALVR Client has been successfully installed on your AjnaXR SE headset!"
echo "Now launch ALVR inside your headset (from Apps / Unknown Sources) and run ./start_alvr.sh on your PC."
