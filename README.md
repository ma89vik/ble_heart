[![Build Actions Status](https://github.com/ma89vik/ble_heart/workflows/Build/badge.svg)](https://github.com/ma89vik/ble_heart/actions)
# ble_heart

# Pre-Requirements
 * CMake installed

# Building the project
 * Set TOOLCHAIN_PATH to the path to your arm-none-eabi folder if toolchain not in path
 * Set NRF_SDK_PATH to the path to your nrf52 SDK
 * Install python requirements from requirements.txt

# Feature plans
 * Pairing process between two devices
 * Every X ms send advertise
 * Button pressed: set up central scan for adv packets from paired device 
    - If found, connect to device, signal with lights, use RSSI to estimate distance -> brighter light, -> go back to power saving after X sec if no button press
    - Heart shaped led, button press->display on connected device
 * Debug mode:
    - RTT logging   
 

# TODO
CI:
  * Check app dont overwrite bootloader

App:

Bootloader:
 * Currently unable to download app image
  