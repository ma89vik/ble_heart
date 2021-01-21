set(APP_LINKER_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/app.ld")
set(BOOTLOADER_LINKER_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/bootloader.ld")

add_subdirectory(app)
add_subdirectory(bootloader)

list(APPEND APP_SRCS "app_main.c")

list(APPEND BOOTLOADER_SRCS "bootloader_main.c")

add_executable(${BLE_HEART_ELF} ${APP_SRCS})
add_executable(${BOOTLOADER_ELF} ${BOOTLOADER_SRCS})

target_link_libraries(${BLE_HEART_ELF} "-L${CMAKE_CURRENT_LIST_DIR}" -T ${APP_LINKER_SCRIPT} app_sdk)
target_link_libraries(${BOOTLOADER_ELF} "-L${CMAKE_CURRENT_LIST_DIR}" -T ${BOOTLOADER_LINKER_SCRIPT} bootloader_sdk)

set(APP_HEX_PATH "${CMAKE_BINARY_DIR}/ble_heart.hex")

add_custom_command(TARGET ${BLE_HEART_ELF}
                   POST_BUILD
                   COMMAND ${CMAKE_OBJCOPY} -O ihex ARGS ${BLE_HEART_ELF} ${APP_HEX_PATH}
                   COMMENT "Generating hex from ${BLE_HEART_ELF}"
                   )

add_custom_command(TARGET ${BOOTLOADER_ELF}
                   POST_BUILD
                   COMMAND ${CMAKE_OBJCOPY} -O ihex ARGS ${BOOTLOADER_ELF} "bootloader.hex"
                   COMMENT "Generating hex from ${BOOTLOADER_ELF}"
                   )


set(APP_VER 1)
set(PRIVATE_KEY_PATH "${PROJECT_SOURCE_DIR}/private.key")
set(SOFTDEVICE_VERSION "0x98")

add_custom_target(create_dfu_package
                    nrfutil pkg generate
                    --hw-version 52
                    --application-version "${APP_VER}"
                    --application ${APP_HEX_PATH}
                    --sd-req ${SOFTDEVICE_VERSION}
                    --key-file ${PRIVATE_KEY_PATH}
                    app_dfu_package.zip
                    DEPENDS ${APP_HEX_PATH}
                    COMMENT "Creating DFU package for ${APP_HEX_PATH}")
