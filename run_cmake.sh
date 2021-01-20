#!/bin/bash

export TOOLCHAIN_PATH="/c/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update"
export NRF_SDK_PATH="/c/Users/Marius/Documents/Project/ble_heart/nrf5_sdk/sdk"


rm -rf build
mkdir build

pip3 install -r requirements.txt
cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_TOOLCHAIN_FILE=toolchain.cmake ..
cmake --build . 