set(BOOTLOADER_LINKER_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/bootloader.ld")

add_subdirectory(app)
#add_subdirectory(bootloader)

list(APPEND BOOTLOADER_SRCS "bootloader_main.c")


 list(APPEND BOOTLOADER_SRCS
 ${SDK_ROOT}/modules/nrfx/mdk/gcc_startup_nrf52.S
 ${SDK_ROOT}/modules/nrfx/mdk/system_nrf52.c
 ${SDK_ROOT}/components/libraries/log/src/nrf_log_frontend.c
 ${SDK_ROOT}/components/libraries/log/src/nrf_log_str_formatter.c
 ${SDK_ROOT}/components/libraries/util/app_error_weak.c
 ${SDK_ROOT}/components/libraries/scheduler/app_scheduler.c
 ${SDK_ROOT}/components/libraries/util/app_util_platform.c
 ${SDK_ROOT}/components/libraries/crc32/crc32.c
 ${SDK_ROOT}/components/libraries/mem_manager/mem_manager.c
 ${SDK_ROOT}/components/libraries/util/nrf_assert.c
 ${SDK_ROOT}/components/libraries/atomic_fifo/nrf_atfifo.c
 ${SDK_ROOT}/components/libraries/atomic/nrf_atomic.c
 ${SDK_ROOT}/components/libraries/balloc/nrf_balloc.c
 ${SDK_ROOT}/external/fprintf/nrf_fprintf.c
 ${SDK_ROOT}/external/fprintf/nrf_fprintf_format.c
 ${SDK_ROOT}/components/libraries/fstorage/nrf_fstorage.c
 ${SDK_ROOT}/components/libraries/fstorage/nrf_fstorage_nvmc.c
 ${SDK_ROOT}/components/libraries/fstorage/nrf_fstorage_sd.c
 ${SDK_ROOT}/components/libraries/memobj/nrf_memobj.c
 ${SDK_ROOT}/components/libraries/queue/nrf_queue.c
 ${SDK_ROOT}/components/libraries/ringbuf/nrf_ringbuf.c
 ${SDK_ROOT}/components/libraries/experimental_section_vars/nrf_section_iter.c
 ${SDK_ROOT}/components/libraries/strerror/nrf_strerror.c
 ${SDK_ROOT}/components/libraries/sha256/sha256.c
 ${SDK_ROOT}/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecc.c
 ${SDK_ROOT}/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecdh.c
 ${SDK_ROOT}/components/libraries/crypto/backend/micro_ecc/micro_ecc_backend_ecdsa.c
 ${SDK_ROOT}/components/boards/boards.c
 ${SDK_ROOT}/modules/nrfx/hal/nrf_nvmc.c
 ${SDK_ROOT}/modules/nrfx/soc/nrfx_atomic.c
 ${SDK_ROOT}/components/libraries/crypto/nrf_crypto_ecc.c
 ${SDK_ROOT}/components/libraries/crypto/nrf_crypto_ecdsa.c
 ${SDK_ROOT}/components/libraries/crypto/nrf_crypto_hash.c
 ${SDK_ROOT}/components/libraries/crypto/nrf_crypto_init.c
 ${SDK_ROOT}/components/libraries/crypto/nrf_crypto_shared.c
 ${SDK_ROOT}/components/ble/common/ble_srv_common.c
 ${SDK_ROOT}/components/libraries/bootloader/nrf_bootloader.c
 ${SDK_ROOT}/components/libraries/bootloader/nrf_bootloader_app_start.c
 ${SDK_ROOT}/components/libraries/bootloader/nrf_bootloader_app_start_final.c
 ${SDK_ROOT}/components/libraries/bootloader/nrf_bootloader_dfu_timers.c
 ${SDK_ROOT}/components/libraries/bootloader/nrf_bootloader_fw_activation.c
 ${SDK_ROOT}/components/libraries/bootloader/nrf_bootloader_info.c
 ${SDK_ROOT}/components/libraries/bootloader/nrf_bootloader_wdt.c
 ${SDK_ROOT}/external/nano-pb/pb_common.c
 ${SDK_ROOT}/external/nano-pb/pb_decode.c
 ${SDK_ROOT}/components/libraries/crypto/backend/nrf_sw/nrf_sw_backend_hash.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/dfu-cc.pb.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu.c
 ${SDK_ROOT}/components/libraries/bootloader/ble_dfu/nrf_dfu_ble.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_flash.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_handling_error.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_mbr.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_req_handler.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_settings.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_settings_svci.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_transport.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_utils.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_validation.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_ver_validation.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_svci.c
 ${SDK_ROOT}/components/libraries/bootloader/dfu/nrf_dfu_svci_handler.c
 ${SDK_ROOT}/components/libraries/svc/nrf_svc_handler.c
 ${SDK_ROOT}/components/softdevice/common/nrf_sdh.c
 ${SDK_ROOT}/components/softdevice/common/nrf_sdh_ble.c
 ${SDK_ROOT}/components/softdevice/common/nrf_sdh_soc.c
 ${SDK_ROOT}/components/libraries/crypto/backend/oberon/oberon_backend_chacha_poly_aead.c
 ${SDK_ROOT}/components/libraries/crypto/backend/oberon/oberon_backend_ecc.c
 ${SDK_ROOT}/components/libraries/crypto/backend/oberon/oberon_backend_ecdh.c
 ${SDK_ROOT}/components/libraries/crypto/backend/oberon/oberon_backend_ecdsa.c
 ${SDK_ROOT}/components/libraries/crypto/backend/oberon/oberon_backend_eddsa.c
 ${SDK_ROOT}/components/libraries/crypto/backend/oberon/oberon_backend_hash.c
 ${SDK_ROOT}/components/libraries/crypto/backend/oberon/oberon_backend_hmac.c
 bootloader/dfu_public_key.c
)

# Include folders common to all targets
list(APPEND INC_FOLDERS
 ${SDK_ROOT}/components/libraries/crypto/backend/micro_ecc
 ${SDK_ROOT}/components/softdevice/s132/headers
 ${SDK_ROOT}/components/libraries/memobj
 ${SDK_ROOT}/components/libraries/sha256
 ${SDK_ROOT}/components/libraries/crc32
 ${SDK_ROOT}/components/libraries/experimental_section_vars
 ${SDK_ROOT}/components/libraries/mem_manager
 ${SDK_ROOT}/components/libraries/fstorage
 ${SDK_ROOT}/components/libraries/util
 ${SDK_ROOT}/modules/nrfx
 ${SDK_ROOT}/external/nrf_oberon/include
 ${SDK_ROOT}/components/libraries/crypto/backend/oberon
 ${SDK_ROOT}/components/libraries/crypto/backend/cifra
 ${SDK_ROOT}/components/libraries/atomic
 ${SDK_ROOT}/integration/nrfx
 ${SDK_ROOT}/components/libraries/crypto/backend/cc310_bl
 ${SDK_ROOT}/components/softdevice/s132/headers/nrf52
 ${SDK_ROOT}/components/libraries/log/src
 ${SDK_ROOT}/components/libraries/bootloader/dfu
 ${SDK_ROOT}/components/ble/common
 ${SDK_ROOT}/components/libraries/delay
 ${SDK_ROOT}/components/libraries/svc
 ${SDK_ROOT}/components/libraries/stack_info
 ${SDK_ROOT}/components/libraries/crypto/backend/nrf_hw
 ${SDK_ROOT}/components/libraries/log
 ${SDK_ROOT}/external/nrf_oberon
 ${SDK_ROOT}/components/libraries/strerror
 ${SDK_ROOT}/components/libraries/crypto/backend/mbedtls
 ${SDK_ROOT}/components/boards
 ${SDK_ROOT}/components/libraries/crypto/backend/cc310
 ${SDK_ROOT}/components/libraries/bootloader
 ${SDK_ROOT}/external/fprintf
 ${SDK_ROOT}/components/libraries/crypto
 ${SDK_ROOT}/components/libraries/crypto/backend/optiga
 ${SDK_ROOT}/components/libraries/scheduler
 ${SDK_ROOT}/modules/nrfx/hal
 ${SDK_ROOT}/components/toolchain/cmsis/include
 ${SDK_ROOT}/components/libraries/balloc
 ${SDK_ROOT}/components/libraries/atomic_fifo
 ${SDK_ROOT}/external/micro-ecc/micro-ecc
 ${SDK_ROOT}/components/libraries/crypto/backend/nrf_sw
 ${SDK_ROOT}/modules/nrfx/mdk
 ${SDK_ROOT}/components/libraries/bootloader/ble_dfu
 ${SDK_ROOT}/components/softdevice/common
 ${SDK_ROOT}/external/nano-pb
 ${SDK_ROOT}/components/libraries/queue
 ${SDK_ROOT}/components/libraries/ringbuf
 bootloader/config
 bootloader/include
)


add_executable(${BOOTLOADER_ELF} ${BOOTLOADER_SRCS})


target_compile_definitions(${BOOTLOADER_ELF} PUBLIC BLE_STACK_SUPPORT_REQD
                                     BOARD_PCA10040
                                     CONFIG_GPIO_AS_PINRESET
                                     FLOAT_ABI_HARD
                                     NRF52
                                     NRF52832_XXAA
                                     NRF52_PAN_74
                                     NRF_DFU_SETTINGS_VERSION=2
                                     NRF_DFU_SVCI_ENABLED
                                     NRF_SD_BLE_API_VERSION=7
                                     S132
                                     SOFTDEVICE_PRESENT
                                     SVC_INTERFACE_CALL_AS_NORMAL_FUNCTION
                                     __HEAP_SIZE=0)
                                     
target_compile_options(${BOOTLOADER_ELF} PUBLIC -Os -g3)

target_include_directories(${BOOTLOADER_ELF} PUBLIC ${INC_FOLDERS})

target_link_libraries(${BOOTLOADER_ELF} "-L${CMAKE_CURRENT_LIST_DIR}" -T ${BOOTLOADER_LINKER_SCRIPT} micro_ecc)

set(BOOTLOADER_HEX_PATH "${CMAKE_BINARY_DIR}/bootloader.hex")


add_custom_command(TARGET ${BOOTLOADER_ELF}
                   POST_BUILD
                   COMMAND ${CMAKE_OBJCOPY} -O ihex ARGS ${BOOTLOADER_ELF} ${BOOTLOADER_HEX_PATH}
                   COMMENT "Generating hex from ${BOOTLOADER_ELF}"
                   )


set(APP_VER 1)
set(PRIVATE_KEY_PATH "${PROJECT_SOURCE_DIR}/private.key")
set(SOFTDEVICE_VERSION "0x0101")

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
