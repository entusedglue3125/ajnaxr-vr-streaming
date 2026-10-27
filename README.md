# AjnaXR SE Game Streaming Setup (Linux + SteamVR)

[![Linux](https://img.shields.io/badge/Platform-Linux%20(Ubuntu%20%2F%20Zorin)-E95420?logo=ubuntu&logoColor=white)](https://ubuntu.com)
[![SteamVR](https://img.shields.io/badge/SteamVR-Compatible-171a21?logo=steam&logoColor=white)](https://store.steampowered.com/app/250820/SteamVR/)
[![ALVR](https://img.shields.io/badge/ALVR-v20.4.3-blue)](https://github.com/alvr-org/ALVR)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> Complete high-performance streaming toolchain to stream SteamVR PC games and VR/XR simulations from Linux (Ubuntu / Zorin OS + NVIDIA GPU) to the **AjnaLens AjnaXR SE** spatial mixed reality headset over wired USB-C or low-latency 5GHz Wi-Fi.

---

## 🚀 Features

- **Wired USB-C Ultra-Low Latency Streaming**: Custom ADB reverse TCP/UDP tunneling (`setup_wired_streaming.sh`) bypassing wireless interference for maximum bitrate and minimum motion-to-photon latency.
- **Wireless 5 GHz Streaming**: Seamless wireless OpenVR bridge for room-scale mobility.
- **SteamVR OpenVR Driver Integration**: Directly integrates with SteamVR Flatpak or native Steam installations.
- **Automated Client Deployment**: One-command APK installation script for the AjnaXR headset via Android Debug Bridge.
- **Hardware Acceleration**: Optimized for NVIDIA Turing / Ampere / Ada Lovelace NVENC hardware encoders.

---

## 📁 Repository Structure

```text
ajna_xr_se/
├── download_binaries.sh          # One-click helper to fetch ALVR streamer & ADB tools
├── install_to_headset.sh         # Installs the ALVR client APK onto connected headset
├── setup_wired_streaming.sh      # Sets up USB ADB port-forwarding for wired VR
├── start_alvr.sh                 # Launches ALVR Dashboard on PC
├── current_headset_view.png      # Capture telemetry of live headset streaming
├── headset_screen.png            # Headset UI capture
└── README.md
```

---

## ⚡ Quick Start

### 1. Download Dependencies
Fetch the matching ALVR Linux streamer and Android tools:
```bash
./download_binaries.sh
```

### 2. Install ALVR Client on Headset
1. Connect your **AjnaXR SE** headset to your PC via a USB-C cable.
2. Put on the headset, grant **Allow USB Debugging**, and check *Always allow from this computer*.
3. Run the auto-installer:
   ```bash
   ./install_to_headset.sh
   ```

### 3. Start Streaming

#### Option A: High-Speed Wired USB Streaming (Recommended)
```bash
# In terminal 1: start port tunneling
./setup_wired_streaming.sh

# In terminal 2: launch streamer
./start_alvr.sh
```
Inside the headset, launch ALVR and connect to `127.0.0.1`.

#### Option B: Wireless 5 GHz Wi-Fi
Ensure PC and AjnaXR SE are on the same 5 GHz Wi-Fi band, then:
```bash
./start_alvr.sh
```
Put on your headset, launch ALVR, and click **Trust** under *New Clients* on your PC dashboard.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
