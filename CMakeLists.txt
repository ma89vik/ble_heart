cmake_minimum_required (VERSION 3.11)
enable_language(C ASM)
find_package (Python3 COMPONENTS Interpreter)


project ("ble_heart")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


set(BLE_HEART_ELF "ble_heart.elf")
set(LINKER_SCRIPT "nrf52.ld")

add_subdirectory(app)
add_subdirectory(nrf5_sdk)

add_executable(${BLE_HEART_ELF} -T ${LINKER_SCRIPT})

target_link_libraries()

# Flash firmware to target.
add_custom_target(bootloader_flash
  openocd -f interface/stlink-v2-1.cfg -c "transport select hla_swd"
  -f target/stm32f4x.cfg -c "init" -c "reset halt"
  -c "flash write_image erase src/bootloader/rc_control_bootloader.elf" -c "reset run" -c "shutdown"
  DEPENDS rc_control_bootloader.elf
  COMMENT "Flashing target hardware")

add_custom_target(app_flash
  openocd -f interface/stlink-v2-1.cfg -c "transport select hla_swd"
  -f target/stm32f4x.cfg -c "init" -c "reset halt"
  -c "flash write_image erase src/app/rc_car_control_board.elf" -c "reset run" -c "shutdown"
  DEPENDS rc_car_control_board.elf
  COMMENT "Flashing target hardware")

add_custom_target(app_bootloader_flash
  openocd -f interface/stlink-v2-1.cfg -c "transport select hla_swd"
  -f target/stm32f4x.cfg -c "init" -c "reset halt"
  -c "flash write_image erase app_bootloader.bin 0x8000000" -c "reset run" -c "shutdown"
  DEPENDS app_bootloader.bin
  COMMENT "Flashing target hardware")


# Run OpenOCD
add_custom_target(openocd
  openocd -f interface/stlink-v2-1.cfg -c "transport select hla_swd" -f target/stm32f4x.cfg -c "init" -c "reset halt"
  COMMENT "Running OpenOCD as a GDB host.")

