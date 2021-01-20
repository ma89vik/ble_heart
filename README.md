[![Build Actions Status](https://github.com/ma89vik/rc_car_control_board/workflows/Build/badge.svg)](https://github.com/ma89vik/rc_car_control_board/actions)
# ble_heart

# Pre-Requirements
 * CMake installed

# Building the project
 * Set TOOLCHAIN_PATH to the path to your arm-none-eabi folder if toolchain not in path
 * Set NRF_SDK_PATH to the path to your nrf52 SDK
 * Install python requirements from requirements.txt

# Features
 * Bootloader with ECDSA signature verification

# TODO
 * SHA hardware acceleration
 * Define and implement control board <-> nav board protocol (protobuf)