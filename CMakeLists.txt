cmake_minimum_required (VERSION 3.11)
enable_language(C ASM)
find_package (Python3 COMPONENTS Interpreter)


project ("ble_heart")

set(SDK_ROOT $ENV{NRF_SDK_PATH})
message(STATUS "SDK Path: ${SDK_ROOT}")

set(NRFJPROG $ENV{NRFJPROG_PATH})
message(STATUS "NRFJPROG Path: ${NRFJPROG}")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(BLE_HEART_ELF "ble_heart.elf")

add_subdirectory(${PROJECT_SOURCE_DIR}/external/micro-ecc)
add_subdirectory(src)

set(SOFTDEVICE_PATH "${SDK_ROOT}/components/softdevice/s132/hex/s132_nrf52_7.2.0_softdevice.hex")

# adds target for erasing and  the board with a softdevice
add_custom_target(softdevice_flash
                    COMMAND ${NRFJPROG} --program ${SOFTDEVICE_PATH} -f nrf52 --sectorerase
                    COMMAND sleep 0.5s
                    COMMAND ${NRFJPROG} --reset -f nrf52
                    COMMENT "flashing SoftDevice"
                    )

add_custom_target(erase_flash
                    COMMAND ${NRFJPROG} --eraseall -f nrf52
                    COMMENT "erasing flashing"
                    )

add_custom_target("app_flash"
                    COMMAND ${NRFJPROG} --program "ble_heart.hex" -f nrf52 --sectorerase
                    COMMAND sleep 0.5s
                    COMMAND ${NRFJPROG} --reset -f nrf52
                    DEPENDS "ble_heart.hex"
                    COMMENT "flashing ble_heart.hex"
                    )

add_custom_target("gdbserver"
                    COMMAND JLinkGDBServer -device nrf52832_xxaa -if swd -port 3333
                    COMMENT "Connecting with JLinkGDBServer"
                    USES_TERMINAL
                    )

add_custom_target("gdb"
                    COMMAND  $ENV{TOOLCHAIN_PATH}/bin/arm-none-eabi-gdb -x ${PROJECT_SOURCE_DIR}/.gdbinit src/bootloader/bootloader.elf
                    COMMENT "Connecting with GDB"
                    USES_TERMINAL
                    )

