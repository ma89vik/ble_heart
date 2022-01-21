#!/bin/bash

export TOOLCHAIN_PATH="/home/marius/toolchains/gcc-arm-none-eabi-9-2020-q2-update/"
export NRF_SDK_PATH="/home/marius/projects/fang/ble_heart/external/nrf_sdk/"
export NRFJPROG_PATH="nrfjprog"

# Python setup (in a virtual env)
python3 -m venv .ble_heart_venv
source .ble_heart_venv/bin/activate
pip3 install -r requirements.txt